Readme doc for setting up build environment and optionally the rsync mirror.
# Building With Script:
### What you will need:
1. Path to directory with repositories
  * Purge and clone script can be used to purge any existing repositories, and
  purge new ones
2. Dependencies installed:
  * Python 2.7
  * Apache Ant

### To begin:
1. Navigate to the esgf-build repo in the terminal
2. Run *esgf_build.py* by typing:
    ``` shell
    python esgf_build.py
    ```
3. Choose which branch you will be updating.
  (either devel or master)
4. Enter the path to the directory containing repositories on the system.
  * Example:
    ``` shell
    Please provide the path to the repositories on your system: /Users/username123/repositories
    ```
5. After the repositories update a menu of repos to build will be listed.
  * Select from the menu by listing the number of the repos to be built.
    * Example:
    ``` shell
    Which repositories will be built? (Hit [Enter] for all) 0, 3, 4
    ```
  * or Hit [ENTER] to select all
6. Entries will begin to build
