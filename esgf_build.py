import subprocess
import os

def update_all(active_branch):
    pass

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
    #Make a variable called all_repos that is a list of strings from the Github
    #urls listed in allrepos.text

    #Use a raw_input statement to ask the user if they want to update devel or master
    #The user's answer will set the active_branch variable; must either be devel or master

    #Run the update_all(active_branch) function, passing in active_branch as an argument

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
