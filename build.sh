#!/usr/bin/env bash
# This script is meant to build and compile every protocolbuffer for each
# service declared in this repository (as defined by sub-directories).
# It compiles using docker containers based on Namely's protoc image
# seen here: https://github.com/namely/docker-protoc

set -e

REPOPATH=opt/protolangs
CURRENT_BRANCH=master

# Helper for adding a directory to the stack and echoing the result
function enterDir {
  echo "Entering $1"
  pushd $1 > /dev/null
}

# Helper for popping a directory off the stack and echoing the result
function leaveDir {
  echo "Leaving `pwd`"
  popd > /dev/null
}

# Enters the directory and starts the build / compile process for the services
# protobufs
function buildDir {
  currentDir="$1"
  echo "Building directory \"$currentDir\""

  enterDir $currentDir

  buildProtoForTypes $currentDir

  leaveDir
}

# Iterates through all of the languages listed in the services .protolangs file
# and compiles them individually
function buildProtoForTypes {
  target=${1%/}

  if [ -f .protolangs ]; then
    while read lang; do
      reponame="dcu_services-$target-$lang"
      echo $lang


      rm -rf $REPOPATH/$reponame

      echo "Cloning repo: https://github.secureserver.net/ITSecurity/$reponame.git"
      git clone https://github.secureserver.net/ITSecurity/$reponame.git $REPOPATH/$reponame

      setupBranch $REPOPATH/$reponame

      # Use the docker container for the language we care about and compile
      docker run -v `pwd`:/defs namely/protoc-all:1.9 -f $target.proto -l $lang

      # Copy the generated files out of the pb-* path into the repository that we care about
      if [ $lang == "go" ]; then
        cp -R `pwd`/gen/pb-go/*.go $REPOPATH/$reponame/
      elif [ $lang == "python" ]; then
        cp -R `pwd`/gen/pb_python/* $REPOPATH/$reponame/
      fi

      commitAndPush $REPOPATH/$reponame
    done <.protolangs
  fi
}

# Finds all directories in the repository and iterates through them calling the
# compile process for each one
function buildAll {
  echo "Building service's protocol buffers"
  rm -rf $REPOPATH
  # mkdir -p $REPOPATH
  for d in */; do
    buildDir $d
  done
}

function setupBranch {
  enterDir $1

  echo "Creating branch"

  if ! git show-branch $CURRENT_BRANCH; then
    git branch $CURRENT_BRANCH
  fi

  git checkout $CURRENT_BRANCH

  if git ls-remote --heads --exit-code origin $CURRENT_BRANCH; then
    echo "Branch exists on remote, pulling latest changes"
    git pull origin $CURRENT_BRANCH
  fi

  leaveDir
}

function commitAndPush {
  enterDir $1

  git add -N .

  if ! git diff --exit-code > /dev/null; then
    git add .
    git commit -m "Auto Creation of Proto"
    git push origin HEAD
  else
    echo "No changes detected for $1"
  fi

  leaveDir
}

buildAll