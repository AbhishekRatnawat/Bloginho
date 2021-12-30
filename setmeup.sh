#!/bin/bash

# A quick setup script to ensure that things are bundled properly and hooks are in place.

cp git_hooks/pre-commit .git/hooks/
bundle install
sudo pip install virtualenv
virtualenv .venv
source .venv/bin/activate
pip install mkdocs
pip install mkdocs-material
