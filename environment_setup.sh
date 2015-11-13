#!/bin/bash
function outputComment {
  if [[ "$1" ]]
    then
      echo '\n'
      outputPoundLine
      echo $1
      outputPoundLine
  fi
}

function outputPoundLine {
	echo "####################################"
}

outputComment "Checking for and installing/updating Homebrew"
which -s brew
if [[ $? != 0 ]] ; then
  echo "Homebrew not found. Will install it."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Homebrew found. Will update it."
  brew update
fi

outputComment "Checking for existing rbenv installation"
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

outputComment "Installing ruby-build, used to help out rbenv so that you can create new versions of Ruby"
which -s ruby-build
if [[ $? -ne 0 ]]; then
  echo "ruby-build found. Will install it."
  brew install ruby-build
else
  echo "ruby-build found. Will upgrade it."
  brew upgrade ruby-build
fi

outputComment "Installing mysql"
which -s mysql
if [[ $? -ne 0 ]] ; then
  brew install mysql
fi

outputComment "Installing local Ruby version"
yes N | rbenv install

outputComment "Rehashing the new version of Ruby"
rbenv rehash

outputComment "Updating to the latest version of Gem manager"
gem update --system

outputComment "Installing bundler, used to manage gems of multiple applications"
gem install bundler --no-ri --no-doc

rbenv rehash

bundle install
