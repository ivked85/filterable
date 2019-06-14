# Filterable
Easy filtering within controllers

## Usage
In ApplicationController add the following line
```ruby
include ::Filterable
```

then you can use the following in your controllers

```ruby
filterable_by :param_name, on: :field_name
```


## Installation
Add this line to your application's Gemfile:

```ruby
gem 'filterable', git: "https://github.com/ivked85/filterable" 
```

And then execute:
```bash
$ bundle install
```

Or install it yourself as:
```bash
$ gem install filterable
```

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
