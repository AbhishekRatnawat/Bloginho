default: style_check

style_check:
	bundle exec mdl -s style.rb docs
