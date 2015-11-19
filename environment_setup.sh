#!/bin/bash
function newSectionComment {
  if [[ "$1" ]]
    then
      echo '\n'
      outputPoundLine
      echo $1
  fi
}

function outputPoundLine {
	echo "####################################"
}

function finishedSectionComment {
  echo "Finished installing $1"
  outputPoundLine
}

newSectionComment "Checking for and installing/updating Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found. Will install it."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew found. Will update it."
  brew update
fi
finishedSectionComment "Homebrew"

newSectionComment "Checking for existing rbenv installation"
eval "$(rbenv init -)"
which -s rbenv
if [[ $? -ne 0 ]] ; then
  echo "rbenv not found. Will install it"
  brew install rbenv
  echo 'eval "$(rbenv init -)"' >>~/.bash_profile;
  eval "$(rbenv init -)"
else
  echo "rbenv found. Will upgrade it."
  brew upgrade rbenv
fi
finishedSectionComment "rbenv"

newSectionComment "Installing ruby-build, used to help out rbenv so that you can create new versions of Ruby"
which -s ruby-build
if [[ $? -ne 0 ]]; then
  echo "ruby-build found. Will install it."
  brew install ruby-build
else
  echo "ruby-build found. Will upgrade it."
  brew upgrade ruby-build
fi
finishedSectionComment "ruby-build"

newSectionComment "Installing mysql"
which -s mysql
if [[ $? -ne 0 ]] ; then
  brew install mysql
fi
finishedSectionComment "MySQL"

newSectionComment "Installing local Ruby version"
yes N | rbenv install
finishedSectionComment "Ruby"

rbenv rehash

newSectionComment "Updating to the latest version of Gem manager"
gem update --system
finishedSectionComment "Gem"

newSectionComment "Installing bundler, used to manage gems of multiple applications"
gem install bundler --no-ri --no-doc
finishedSectionComment "bundler"

rbenv rehash

bundle install

newSectionComment "Installing pre-commit via npm"
npm install
finishedSectionComment "pre-commit"
