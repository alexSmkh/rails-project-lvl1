install: # Install dependencies
	bundle install

lint:
	bundle exec rubocop .
