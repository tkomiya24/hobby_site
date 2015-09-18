#!/bin/bash
function outputComment {
  if [[ "$1" ]]
    then
      outputPoundLine
      echo $1
      outputPoundLine
      echo '\n'
  fi
}

function outputPoundLine {
	echo "####################################"
}

function installNpmGlobalPackage {
  npm list -g $1 -g &> /dev/null
  if [[ $? -ne 0 ]] ; then
    npm install -g $1
  fi
}

outputComment "Checking for and installing/updating Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  brew update
fi

outputComment "Installing rbenv"
which -s rbenv
if [[ $? -ne 0 ]]
  then
  brew install rbenv
  echo 'eval "$(rbenv init -)"' >>~/.bash_profile;
fi
eval "$(rbenv init -)"

outputComment "Installing ruby-build, used to help out rbenv so that you can create new versions of Ruby"
brew install ruby-build

outputComment "Installing mysql"
which -s mysql
if [[ $? -ne 0 ]] ; then
  brew install mysql
fi

outputComment "Installing Ruby 2.2.0-rc1..."
yes N | rbenv install 2.2.0-rc1

outputComment "Rehash the new version of Ruby"
rbenv rehash

outputComment "Setting Ruby 2.2.0-rc1 to local"
rbenv local 2.2.0-rc1

outputComment "Updating to the latest version of Gem manager"
gem update --system

outputComment "Installing bundler, used to manage gems of multiple applications"
gem install bundler --no-ri --no-doc --version 1.10.3

outputComment "Rehash rbenv"
rbenv rehash

outputComment "Installing rails 4.2.0"
gem install rails --no-ri --no-doc --version 4.2.0

outputComment "Rehash again"
rbenv rehash

outputComment "Installing mysql Ruby Gem..."
gem install mysql2 --no-ri --no-doc  --version 0.3.18

bundle install
