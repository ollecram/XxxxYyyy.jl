#!/bin/bash

# B E F O R E   R U N N I N G   T H I S   S C R I P T
# 1.     E N S U R E   the following global variables
#                  are defined to the local Git
#
#   git config --global user.name
#   git config --global user.email
#   git config --global github.user
# 
#
# B E F O R E   R U N N I N G   T H I S   S C R I P T
# 2.     M A N U A L L Y  Generate Project.toml for the 
#                  new package using Julia Pkg generate
#
# cd /tmp
# julia
# ]
# (1.3) pkg> generate <package-name>
# Backspace
# Ctrl+D
#
# B E F O R E   R U N N I N G   T H I S   S C R I P T
# 3.     C H A N G E   D I R E C T O R Y  to  that of 
#        the local project clone: <package-name>
#
#----------------------------------------------------

# Set some variables from Git 

# Git User Name
userName=`git config --global user.name`

# Git User Email
userEmail=`git config --global user.email`

# GitHub User Account
githubUserAccount=`git config --global github.user`

# Package name
packageName=$1

# Documenter uuid
documenterUuid="e30172f5-a6a5-5a46-863b-614d45cd2de4"

# Test Uuid
testUuid="8dfed614-e22c-5e08-85e1-65c5234f0b40"

# A. Check current directory against 1st argument (package name)
currentDir=${PWD##*/}
if [ $currentDir != $packageName ]; then
  echo "Error: package name and script directory do not match!"
  exit 1
fi

# B. Retrieve UUID from Project.toml of the template's original
uuidLine=$(sed '2!d' Project.toml | sed 's/ *//g')
eval "$uuidLine"
templateUuid=$uuid

# C. Replace the template package definition with the generated one
sed -e '1,4d' < Project.toml > /tmp/tail
cat /tmp/$packageName/Project.toml | cat - /tmp/tail > /tmp/Project.toml && mv /tmp/Project.toml Project.toml

# Clean-up /tmp
# rm /tmp/tail
# rm -rf /tmp/$packageName

# D. Retrieve package's uuid from the updated Project.toml
uuidLine=$(sed '2!d' Project.toml | sed 's/ *//g')
eval "$uuidLine"
packageUuid=$uuid

# E. Replace the template's uuid with the actual one within all files (but those inside .git !!)
eval "find ./ -path ./.git -prune -o -type f -exec sed -i -e 's/$templateUuid/$packageUuid>/g' {} \;"

# F. ToDo replace XxxxYyyy with <package-name>


# Echo 
echo user name: $userName
echo user email: $userEmail
echo github account $githubUserAccount
echo current directory: $currentDir
echo package name: $packageName
echo template uuid: $templateUuid
echo package  uuid: $packageUuid
echo documenter uuid: $documenterUuid
echo test uuid: $testUuid
echo -------------------------------------
echo content of Project.toml
echo -------------------------------------
cat Project.toml


# 




