#
# Markdown Lint Rules
#
# The enabled rules have been defined individually for information purposes.
#
# https://github.com/mivok/markdownlint/blob/master/docs/RULES.md
#

# MD001 - Header levels should only increment by one level at a time
rule 'MD001'
# MD002 - First header should be a h1 header
rule 'MD002'
# MD003 - Header style - default=(:style => :consistent)
rule 'MD003', :style => :atx
# MD004 - Unordered list style - default=(:style => :consistent)
rule 'MD004'
# MD005 - Inconsistent indentation for list items at the same level
rule 'MD005'
# MD006 - Consider starting bulleted lists at the beginning of the line
rule 'MD006'
# MD007 - Unordered list indentation - default=(:indent => 2)
rule 'MD007', :indent => 4
# MD009 - Trailing spaces - default=(:br_spaces => 0)
rule 'MD009'
# MD010 - Hard tabs
rule 'MD010'
# MD011 - Reversed link syntax
rule 'MD011'
# MD012 - Multiple consecutive blank lines
rule 'MD012'
# MD013 - Line length - default=(:line_length => 80)
#rule 'MD013', :line_length => 120
# MD014 - Dollar signs used before commands without showing output
rule 'MD014'
# MD018 - No space after hash on atx style header
rule 'MD018'
# MD019 - Multiple spaces after hash on atx style header
rule 'MD019'
# MD020 - No space inside hashes on closed atx style header
#rule 'MD020'
# MD021 - Multiple spaces inside hashes on closed atx style header
#rule 'MD021'
# MD022 - Headers should be surrounded by blank lines
rule 'MD022'
# MD023 - Headers must start at the beginning of the line
rule 'MD023'
# MD024 - Multiple headers with the same content
rule 'MD024'
# MD025 - Multiple top level headers in the same document
rule 'MD025'
# MD026 - Trailing punctuation in header
rule 'MD026'
# MD027 - Multiple spaces after blockquote symbol
#rule 'MD027'
# MD028 - Blank line inside blockquote
#rule 'MD028'
# MD029 - Ordered list item prefix - default=(:style => :one)
rule 'MD029'
# MD030 - Spaces after list markers - default(:ul_single, ol_single, ul_multi, ol_multi => 1)
rule 'MD030'
# MD031 - Fenced code blocks should be surrounded by blank lines
#rule 'MD031'
# MD032 - Lists should be surrounded by blank lines
#rule 'MD032'
# MD033 - Inline HTML
rule 'MD033'
# MD034 - Bare URL used
rule 'MD034'
# MD035 - Horizontal rule style
rule 'MD035', :style => '---'
# MD036 - Emphasis used instead of a header
rule 'MD036'
# MD037 - Spaces inside emphasis markers
rule 'MD037'
# MD038 - Spaces inside code span elements
rule 'MD038'
# MD039 - Spaces inside link text
rule 'MD039'
# MD040 - Fenced code blocks should have a language specified
#rule 'MD040'
# MD041 - First line in file should be a top level header
#   This is broken
#rule 'MD041'

