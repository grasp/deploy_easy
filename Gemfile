source 'https://ruby.taobao.org'

# Padrino supports Ruby version 1.9 and later
# ruby '2.2.3'

# Distribute your app as a gem
gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem 'rake'

# Component requirements
gem 'bcrypt'
gem 'haml'
gem 'mongoid', '>= 3.0.0'


#web server
gem  "thin"
gem "unicorn"

#paginate
gem 'will_paginate'
gem "will_paginate-bootstrap"

#cache
gem 'redis'
gem 'redis-store'
gem 'redis-rack'

gem 'config'

gem 'axlsx'
gem 'roo'

gem 'redcarpet'




#gem 'httparty'
#gem 'rest-client'


group :development do
  gem 'guard' # NOTE: this is necessary in newer versions
  gem 'guard-minitest'
end

# Test requirements
gem 'minitest', :require => 'minitest/autorun', :group => 'test'
gem 'rack-test', :require => 'rack/test', :group => 'test'
gem "minitest-reporters"
# Padrino Stable Gem


# Padrino Stable Gem
gem 'padrino', '0.13.2'

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.13.2'
# end
