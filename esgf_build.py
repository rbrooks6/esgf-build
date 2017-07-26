#!usr/bin/env python
'''Modules needed mostly to access terminal commands'''
import subprocess
import shlex
import os
from git import Repo
import repo_info
import tarfile
from distutils.spawn import find_executable

#repo_info.all_repo_urls
#repo_info.repo_list

def update_all(active_branch):
    '''Checks each repo in the repo_list for the most updated branch '''
    taglist will keep track of different versions
    fileobject = open("taglist.txt", "w")
    for repo in repo_info.repo_list:
        os.chdir(repo)
        #getting the current working directory (mimics bash pwd)
        repo_handle = Repo(os.getcwd())
        #changes to the active branch using checkout
        repo_handle.git.checkout(active_branch)
        repo_handle.remote.origin.pull()
        #provides all the tags, reverses them (so that you can get the latest
        #tag and then takes only the first from the list
        latest_tag = repo_handle.tags().reverse()[0]
        fileobject.write(latest_tag)
        #moves up one directory
        os.chdir("..")
    fileobject.close()

    ##TODO: For testing
    print "Made it to update_all"
    print "active_branch: ", active_branch

def build_all(build_list):
    '''Takes a list of repositories to build, and uses ant to build them '''
    #use subprocess for ANT
    #locate the paths for ANT, java, and python
    ant_path = find_executable('ant')
    java_path = find_executable('java')
    python_path = find_executable('python')

    log_directory = os.getcwd() + "/buildlogs"
    for repo in build_list:
        #creates clean pull and build logs for  each repo
        ###TODO: log ant output to clean, pull, and build logs for appropriate repo
        clean_log = log_directory + "/" + repo + "-clean.log"
        with open("clean_log.txt", "w") as f1:
            subprocess.call('ant allclean')
        pull_log = log_directory + "/" + repo + "-pull.log"
        with open("pull_log.txt", "w") as f2:
            subprocess.call("ant pull")
        build_log = log_directory + "/" + repo + "-build.log"
        with open("build_log.txt", "w") as f3:
            subprocess.call("ant make_dist")

        #TODO: call ANT esgf-getcert clean and build seperatley

def create_esgf_tarballs():
    #import tarfile
    pass

def create_local_mirror_directory(active_branch):
    pass

def update_esg_node(active_branch):
    pass

def esgf_upload():
    pass


def main():
    '''User prompted for build specifications '''
    #Use a raw_input statement to ask the user if they want to update devel or master
    #The user's answer will set the active_branch variable; must either be devel or master
    while True:
        active_branch = raw_input("Do you want to update devel or master branch?")

        #Run the update_all(active_branch) function, passing in active_branch as an argument
        if active_branch.lower() not in ["devel", "master"]:
            print "Please choose either master or devel."
            continue

        else:
            break
    update_all(active_branch)

    #Use a raw_input statement to ask which repos should be built;
    #this will set the build_list variable; If the user enters nothing, assume all repos will be built
    while True:
        build_list = raw_input("Which repositories will be built? (Hit [Enter] for all)")

        if not build_list:
            all_repo_q =raw_input("Do you want to build all repositories? (Y or YES)")
            if all_repo_q.lower() not in ["yes", "y"]:
                print "Not a valid response."
                continue

            else:
                build_list = repo_info.repo_list
                break
    build_all(build_list)

    #Use a raw_input statement to ask the user to set the script_major_version, script_release, and
    #script_version
    script_major_version = raw_input("Please set the script_major_version: ")
    script_release = raw_input("Please set the script_release: ")
    script_version = ("Please set the script version: ")

    #execute the create_esgf_tarballs() function

    #execute the create_local_mirror_directory(active_branch), passing in active_branch as an argument

    #execute update_esg_node(active_branch), passing in active_branch as an argument

    #execute esgf_upload()

if __name__ == '__main__':
    main()