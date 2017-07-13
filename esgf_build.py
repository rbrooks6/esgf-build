#!usr/bin/env python2
import subprocess
import shlex
import os
from git import Repo
import repo_info

#repo_info.all_repo_urls
#repo_info.repo_list

def update_all(active_branch):
    #taglist will keep track of different versions
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

def build_all(build_list):
    pass

def create_esgf_tarballs():
    pass

def create_local_mirror_directory(active_branch):
    pass

def update_esg_node(active_branch):
    pass

def esgf_upload():
    pass

def main():
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

    #Execute build_all(build_list), passing in the build_list variable as an argument

    #Use a raw_input statement to ask the user to set the script_major_version, script_release, and
    #script_version


    #execute the create_esgf_tarballs() function

    #execute the create_local_mirror_directory(active_branch), passing in active_branch as an argument

    #execute update_esg_node(active_branch), passing in active_branch as an argument

    #execute esgf_upload()
    pass

if __name__ == '__main__':
    main()
