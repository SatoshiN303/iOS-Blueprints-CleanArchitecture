#!/bin/sh

if which bundle >/dev/null; then
  echo "Install Gems"
  bundle install
else
  echo "bundle command not found. run `gem install bundler`"
  exit
fi

if which brew >/dev/null; then
  echo "Install Brews"
  brew bundle
else
  echo "brew command not found. Please install Homebrew"
  exit
fi


# install dependencies via CocoaPods
echo "Install dependencies via CocoaPods"
pod install

# install dependencies via Carthage
echo "Install dependencies via Carthage"
carthage bootstrap --platform ios --no-use-binaries --cache-builds

echo "Enjoy Coding!🥂"

open {{cookiecutter.app_name}}.xcworkspace
