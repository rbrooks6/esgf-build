# Building With Script:
### What you will need:
1. Path to directory with repositories
    * Purge and clone script can be used to purge any existing repositories, and
clone new ones
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
    Users/username123/repositories
    ```
5. After the repositories update a menu of repos to build will be listed.
    * Select from the menu by listing the number of the repos to be built.
    * Example:
    ``` shell
    0, 3, 4
    ```
    * or Hit [ENTER] to select all
6. Old tarballs will be purged where applicable, and new tarballs will attempt to build.
  If successful, "BUILD SUCCESSFUL" will print.
7. If the script information is different than the default, enter script info to
  be used to update node.
8. Local mirror directory will be created if it does not already exist, and tarballs will be extracted to it.

COMING SOON
------------
9. Node will be updated with script settings and binaries to upload are validated.
10. Upload to coffee server.
