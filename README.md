# FormGenerator

[![hexlet-check](https://github.com/alexSmkh/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg?branch=main)](https://github.com/alexSmkh/rails-project-lvl1/actions/workflows/hexlet-check.yml)

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

FormGenerator::Tag.build('br')
# <br>

FormGenerator::Tag.build('img', src: 'path/to/image')
# <img src="path/to/image">

FormGenerator::Tag.build('input', type: 'submit', value: 'Save')
# <input type="submit" value="Save">

FormGenerator::Tag.build('label') { 'Email' }
# <label>Email</label>

FormGenerator::Tag.build('label', for: 'email') { 'Email' }
# <label for="email">Email</label>

FormGenerator::Tag.build('div')
# <div></div>
```

