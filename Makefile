install: # Install dependencies
	bundle install

lint:
	bundle exec rubocop .

test:
	bundle exec rake spec
