# Welcome to Contributing to Ops Runbooks for Fields

If you wish to contribute to this project please start by creating an OPE ticket and linking it to
[OPE-1021](https://backlog.acquia.com/browse/OPE-1021) to provide visibility for others working on documentation.

1. [Guidelines](#guidelines)
    1. [Main Topics](#main-topics)
1. [Contributing](#contributing)
    1. [Workflow](#workflow)
    1. [Local Development](#local-development)
        1. [Setup](#setup)
        1. [Reviewing](#reviewing)
        1. [Shortcutting](#shortcutting)
    1. [Linting](#linting)
    1. [Labels](#labels)
        1. [Approved](#approved)

## Guidelines

Please view the [style guide](/runbook_metadocs/style) before contributing any content.

### Main Topics

If you are unsure of where to create your page, please ask for assistance by sending an email to
[ops-forum@acquia.com](mailto:ops-forum@acquia.com)

* [Alerts](/incident_response): Procedures for incident response
* [Bastion](/kanban_tickets#bastion)
* [Database](/kanban_tickets#database): Information pertaining to MySQL and Tungsten
* [Gluster](/kanban_tickets#gluster)
* [Instance Deprovision](/kanban_tickets#site-deprovision)
* [Instance Management](/kanban_tickets#instance_management)
* [Instance Provision](/kanban_tickets#instance-provision)
* [Mass Maintenance](/realm_management): Reboots and relaunches for security patching and AWS maintenance
* [Realm Management](/realm_management): Fields administration
* [Search](/kanban_tickets#search): Acquia Search Service
* [Site Deprovision](/kanban_tickets#site-deprovision)
* [Site Management](/kanban_tickets#site-management)
* [Site Provision](/kanban_tickets#site-provision)
* [TLS/SSL](/kanban_tickets#ssl)
* [VPC](/kanban_tickets#vpc): Acquia Shield

## Contributing

This section details how we develop, test, commit and review changes.

Please review this entire section before starting work.

### Workflow

1. All work must be tied to a Jira ticket.
1. Branch names are prefixed with the ticket - i.e. 'OP-1234_add-ace-reboot-procedure'.
1. PRs
    1. Have the title of 'OP-1234 | Short description of change'.
    1. Are labelled 'needs-review'.
    1. Have links to generated pages on [runbook.ops.acquia.com](https://runbook.ops.acquia.com/)(LDAP creds).
      **NOTE:** `update-mkdocs` runs at */10.
    1. Have links to OpsWiki™ pages where relevant.
    1. Show output of added/modified commands, where relevant.
1. Merges
    1. Are done after at least two people have approved and >24 hours has passed since PR creation.
    1. Bypass the 24 hour rule if it's a bugfix.
1. If the PR obsoletes an OpsWiki™ page, update the page with a redirect of, for example:
  `{{migrated|database/xtrabackup}}`

### Local Development

#### Setup (Automated)

To set-up your local machine to view documentation locally and run the appropriate
syntax and linting tests run `./setmeup.sh` in the root of your repo's directory.

#### Setup (Manual)

Our method of reviewing a change is to view generated pages on
[runbook.ops.acquia.com](https://runbook.ops.acquia.com/) because we auto-generate HTML from MarkDown. If you submit a
PR for a fork, reviewers will not be able to properly review your work. Please go to
[https://github.acquia.com/](https://github.acquia.com) to request push access to this repo.

    git clone git@github.com:acquia/ops-runbook-fields.git
    cd ops-runbook-fields
    cp git_hooks/pre-commit .git/hooks/
    bundle install
    sudo pip install virtualenv
    virtualenv .venv
    source .venv/bin/activate
    pip install mkdocs

#### Reviewing

    source .venv/bin/activate
    mkdocs serve

Then open <http://localhost:8000> in your browser. The pages will automatically refresh as you save files.

#### Shortcutting

If your distro appends `$HOME/bin` to `$PATH` by default:

    $ cat > ~/bin/runbook <<EOF
    #!/usr/bin/env bash

    cd ~/dev/ops-runbook-fields
    source .venv/bin/activate
    mkdocs serve
    cd -
    EOF
    chmod 755 ~/bin/runbook

### Linting

[Markdownlint](https://github.com/mivok/markdownlint)

    bundle install
    bundle exec mdl -s style.rb docs

### Labels

We use several labels to organise our PRs. These are the most common ones:

* [Approved](#approved)
* [Needs review](https://github.com/acquia/ops-runbook-fields/pulls?q=is%3Apr+is%3Aopen+label%3A%22needs+review%22)
* [Needs work](https://github.com/acquia/ops-runbook-fields/pulls?q=is%3Apr+is%3Aopen+label%3A%22needs+work%22)
* [Do not merge](https://github.com/acquia/ops-runbook-fields/pulls?q=is%3Apr+is%3Aopen+label%3A%22do+not+merge%22)
* [Bug fix](https://github.com/acquia/ops-runbook-fields/pulls?q=is%3Apr+is%3Aopen+label%3A%22bug+fix%22)
* [Enhancement](https://github.com/acquia/ops-runbook-fields/pulls?q=is%3Apr+is%3Aopen+label%3Aenhancement)

#### Approved

Approved labels are coloured green, are per user, and are in the format of `approved-$USER` to make the labels sort
properly. To create your own label:

* [How to create a new Github label](https://help.github.com/articles/creating-and-editing-labels-for-issues-and-pull-requests/)
