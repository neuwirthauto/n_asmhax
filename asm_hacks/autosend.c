#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <git2.h>  // Make sure to link with -lgit2

#define MAX_LINE_LENGTH 1024
#define LOG_FILE "logs.txt"

char* get_current_time() {
    time_t raw_time;
    struct tm *time_info;
    char *time_str = (char *)malloc(20 * sizeof(char));
    
    time(&raw_time);
    time_info = localtime(&raw_time);
    strftime(time_str, 20, "%Y-%m-%d %H:%M:%S", time_info);
    
    return time_str;
}

void log_message(const char *message) {
    FILE *log_file = fopen(LOG_FILE, "a");
    if (log_file == NULL) {
        perror("Error opening log file");
        exit(1);
    }
    
    char *current_time = get_current_time();
    fprintf(log_file, "[%s] %s\n", current_time, message);
    free(current_time);
    fclose(log_file);
}

int main() {
    FILE *repo_file = fopen("repos.txt", "r");
    FILE *config_file = fopen("config.txt", "r");
    if (repo_file == NULL || config_file == NULL) {
        perror("Error opening file");
        return 1;
    }

    // Read repository list
    char repo_list[100][MAX_LINE_LENGTH];
    int repo_count = 0;
    char line[MAX_LINE_LENGTH];

    while (fgets(line, sizeof(line), repo_file)) {
        if (line[0] != '#') {
            line[strcspn(line, "\n")] = 0;  // Remove newline character
            strcpy(repo_list[repo_count++], line);
        }
    }

    fclose(repo_file);

    // Read configuration
    int threshold;
    if (fscanf(config_file, "%*s\n%d", &threshold) != 1) {
        perror("Error reading configuration file");
        fclose(config_file);
        return 1;
    }

    fclose(config_file);

    // Log program start
    char start_message[100];
    snprintf(start_message, sizeof(start_message), "Program Started at %s", get_current_time());
    log_message(start_message);

    printf("Program is Active\n");

    while (1) {
        sleep(threshold);
        for (int i = 0; i < repo_count; i++) {
            git_libgit2_init();
            git_repository *repo = NULL;
            int error = git_repository_open(&repo, repo_list[i]);
            if (error < 0) {
                const git_error *e = git_error_last();
                fprintf(stderr, "Error opening repository: %s\n", e->message);
                log_message(e->message);
                continue;
            }

            git_status_options status_opts = GIT_STATUS_OPTIONS_INIT;
            git_status_list *status;
            error = git_status_list_new(&status, repo, &status_opts);
            if (error < 0) {
                const git_error *e = git_error_last();
                fprintf(stderr, "Error getting status: %s\n", e->message);
                log_message(e->message);
                git_repository_free(repo);
                continue;
            }

            if (git_status_list_entrycount(status) > 0) {
                // Stage all changes
                git_index *index;
                error = git_repository_index(&index, repo);
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error getting index: %s\n", e->message);
                    log_message(e->message);
                    git_status_list_free(status);
                    git_repository_free(repo);
                    continue;
                }

                error = git_index_add_all(index, NULL, GIT_INDEX_ADD_DEFAULT, NULL, NULL);
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error adding to index: %s\n", e->message);
                    log_message(e->message);
                    git_index_free(index);
                    git_status_list_free(status);
                    git_repository_free(repo);
                    continue;
                }

                error = git_index_write(index);
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error writing index: %s\n", e->message);
                    log_message(e->message);
                    git_index_free(index);
                    git_status_list_free(status);
                    git_repository_free(repo);
                    continue;
                }

                // Create a tree from the index
                git_oid tree_oid;
                error = git_index_write_tree(&tree_oid, index);
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error writing tree: %s\n", e->message);
                    log_message(e->message);
                    git_index_free(index);
                    git_status_list_free(status);
                    git_repository_free(repo);
                    continue;
                }

                git_tree *tree;
                error = git_tree_lookup(&tree, repo, &tree_oid);
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error looking up tree: %s\n", e->message);
                    log_message(e->message);
                    git_index_free(index);
                    git_status_list_free(status);
                    git_repository_free(repo);
                    continue;
                }

                // Create a commit
                git_oid commit_oid;
                git_signature *sig;
                git_signature_now(&sig, "Auto Commit", "auto@commit.com");
                const char *message = "Auto Commit";
                error = git_commit_create_v(
                    &commit_oid, repo, "HEAD", sig, sig, NULL, message,
                    tree, 0, NULL);
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error creating commit: %s\n", e->message);
                    log_message(e->message);
                    git_signature_free(sig);
                    git_index_free(index);
                    git_status_list_free(status);
                    git_repository_free(repo);
                    continue;
                }

                // Push changes to remote
                git_remote *remote;
                error = git_remote_lookup(&remote, repo, "origin");
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error looking up remote: %s\n", e->message);
                    log_message(e->message);
                    git_signature_free(sig);
                    git_index_free(index);
                    git_status_list_free(status);
                    git_repository_free(repo);
                    continue;
                }

                git_push_options push_opts = GIT_PUSH_OPTIONS_INIT;
                error = git_remote_push(remote, NULL, &push_opts);
                if (error < 0) {
                    const git_error *e = git_error_last();
                    fprintf(stderr, "Error pushing to remote: %s\n", e->message);
                    log_message(e->message);
                }

                printf("Changes pushed for %s\n", repo_list[i]);
                char log_entry[200];
                snprintf(log_entry, sizeof(log_entry), "Changes pushed for %s at %s", repo_list[i], get_current_time());
                log_message(log_entry);

                // Call the external 'compact' executable
                char command[200];
                snprintf(command, sizeof(command), "./compact %s formatted_output.c", repo_list[i]);
                int result = system(command);
                if (result != 0) {
                    snprintf(log_entry, sizeof(log_entry), "Error formatting code for %s", repo_list[i]);
                    log_message(log_entry);
                }

                git_signature_free(sig);
                git_index_free(index);
                git_tree_free(tree);
                git_remote_free(remote);
            }

            git_status_list_free(status);
            git_repository_free(repo);
            git_libgit2_shutdown();
        }
    }

    return 0;
}

