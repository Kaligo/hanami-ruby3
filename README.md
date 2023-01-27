# Hanami Ruby 3.0

Monkey patches Hanami components to support Ruby 3.0

## Overview

To use this gem, make sure your app works with Ruby 2.7.6.

This should only be installed for a short time, during the Hanami Upgrade process.
It just overrides a few of the Hanami classes, replacing code raising deprecation
warnings with updated code supported Ruby 3.0 syntax.


### Usage

In your project, install overrides for the given classes

```ruby
gem 'hanami-utils', github: 'swilgosz/hanami-utils', branch: '1.3.x-support-ruby-3.0'
gem 'hanami-ruby3', path: '../hanami-ruby3'
```

Then load overrides in the `environment.rb`, after loading Hanami files.

```ruby
require 'hanami/setup'
require 'hanami/ruby3'
```

With this, you should not have any Ruby Deprecation warnings and you should be fine do update to Ruby 3.0
