#!/bin/bash

# A quick setup script to ensure that things are bundled properly and hooks are in place.

cp git_hooks/pre-commit .git/hooks/
bundle install
sudo pip install virtualenv
virtualenv .venv
source .venv/bin/activate
pip install mkdocs

echo 'CONGRATULATIONS! You are now ready to contribute to ops-runbook-fields!
To help make visual review and manual linting easier, try adding these to your
~/.bashrc (Linux) or ~/.bash_profile (Mac):

function runbook {
  pushd YOUR_OPS-RUNBOOK-FIELDS_REPO_DIR
  source .venv/bin/activate
  mkdocs serve
  popd
}

function runbook-mdl {
  pushd YOUR_OPS-RUNBOOK-FIELDS_REPO_DIR
  bundle exec mdl -s style.rb docs
  popd
}'
