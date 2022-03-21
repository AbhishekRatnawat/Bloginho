# Ops Runbook (Fields) Style Guide

[MarkDownLint](https://github.com/mivok/markdownlint) ensures that all documents in this repository meet a minimum
standard for formatting and style.

## Install and Use

```
bundle install
bundle exec mdl -s style.rb docs
```

### Rules file

The current rules are defined in
[/style.rb](https://github.com/acquia/ops-runbook-fields/blob/master/style.rb).

## The Standard

The goal of this guide is to ensure that all pages are as similar and easy to
use as possible. The conventions laid out below have been chosen for
cleanliness and best practice. There are other ways of writing markdown, but
these ones are preferred.

### Verbiage

Your content is worded definitely in the present tense. There is no ambiguity, and terminology is clinical. Procedures
are numbered and tractable. Assumptions are also never made, with exception of some basics:

* [ops-misc](https://github.com/acquia/ops-misc) is properly configured.
* A person is in the relevant realm, i.e. they have already run aprod, adevcloud, etc.
* They are in `~/fields/$FIELDSVER/`, i.e. ./fields-provision.php and the ah-tools work.
* All needed credentials are in place for:
    * ec2
    * aws
    * ah-tools
* Commands that move a person from the fields directory are controlled with `pushd` and `popd`.

### Headings

* The ATX method of headings is used exclusively.
* The first line of every page is an H1 title.
* Headings must only ever increase by one, so H1 to H3 is illegal and you must have used H2 in between.
* There must only be one H1 (title) per page.

```
# Heading 1 (Title)
## Heading 2
### Heading 3
#### Heading 4
```

### Lists

Both ordered and unordered lists are indented by four spaces between levels. If
extra paragraphs are needed they are simply indented by a further four spaces.

#### Ordered

```
1. instruction one
    1. sub-instruction one
        1. sub-sub-instruction one
    1. sub-instruction two
1. instruction two

    Second paragraph for instruction two

1. instruction three
```

#### Unordered

```
* item one
    * sub-item one

        Another paragraph for sub-item one

        * sub-sub-item one
        * sub-sub-item two
    * sub-item two
* item two
```

#### Code in lists

Back ticks are preferable most of time, but when inside of a list you must use indentation of code blocks in order to
not break the list count.

Code must be indented by a further four spaces from the current next level of
the list. I.e. eight spaces for level one and twelve spaces for level two.

```
1. instruction one

        # code block indented by 8 spaces
        dd if=/dev/urandom of=/dev/sda

1. instruction two

    with an extra note between instructions that doesn’t break numbering

1. instruction three

    with an extra note between instructions, but this time with a code block

        # moar coad
        echo “8 spaces is where is at”

        1. sub-instruction

            rm -rf --no-preserve-root /
```

### Variables

Use them and have them automatically created where possible. Define as many variables as the procedure needs at the
top of the document.

#### Standard Variables

```
INSTANCE=i-as12df34
SERVER=ded-1
SERVERS=ded-1,web-2,foo-3
SITENAME=fubarptyltddev
SITEGROUP=fubarptyltd
STAGE=dev
REGION=us-east-1
AZ=us-east-1a
AZS=(us-east-1a us-east-1b)
SRC=ded-1
DST=fsdb-2
SIZE=100
NEW_VOL=vol-asdf1234
OLD_VOL=vol-1234asdf
```

#### Common Reserved Variables

```
FIELDS_STAGE
EC2_ACCOUNT
FIELDS_SERVER_DOMAIN
FIELDS_MASTER_DOMAIN
HOSTING_VERSION
FIELDSVER
OPSTMP
OPSLOG
```

### Coding

We use the [Google shell standard](https://google.github.io/styleguide/shell.xml)
for all code. Important notes:

* Always use $() instead of \`\` for readability and to avoid markdown rendering issues

* If a code block uses pipes then the pipe will be indented on the next line:

        echo "foo bar" \
          | grep foo \
          | sed 's/bar/baz/'

* When using commands with lots of options, please ensure that the command is
easy to interpret and provides output in `{noformat}` tags for ticket comments.

        OUTPUT=$(fpdsh \
          -t site:mysite \
          -n web \
          -p 100 \
          -c "sudo echo '#YOLO'")

    -OR-

        echo "{noformat}" \
          && ah-server list bal-% --no-name \
            -w ec2_regionINus-east-1,ap-southeast-2,eu-west-1 eip_id=nil \
            -c ec2_id \
            | paste -sd, \
          && echo "{noformat}"

