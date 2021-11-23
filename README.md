# FormGenerator

[![hexlet-check](https://github.com/alexSmkh/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg?branch=main)](https://github.com/alexSmkh/rails-project-lvl1/actions/workflows/hexlet-check.yml)
[![Rubocop](https://github.com/alexSmkh/rails-project-lvl1/actions/workflows/rubocop-check.yml/badge.svg?branch=main)](https://github.com/alexSmkh/rails-project-lvl1/actions/workflows/rubocop-check.yml)

This gem is simple implementation of the [Simple-Form](https://github.com/heartcombo/simple_form).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'form_generator'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install form_generator

## Usage

```ruby
require 'form_generator'

User = Struct.new(:name, :job, keyword_init: true)
user = User.new job: 'hexlet'

FormGenerator.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input name="commit" type="submit" value="Save" >
# </form>
```

