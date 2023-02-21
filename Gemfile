source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'concurrent-ruby', :require => 'concurrent'                           # Modern concurrency tools
gem 'discordrb', :github => 'shardlab/discordrb', :branch => 'main'       # Discord API for Ruby
gem 'ruby-duration', '~> 3.2', '>= 3.2.3'                                 # Immutable Duration type

group :development do
  gem 'bcrypt_pbkdf', '>= 1.0', '< 2.0'                                   # Resolve OpenSSH problems with capistrano
  gem 'capistrano', '~> 3.14', :require => false                          # Deployment
  gem 'capistrano-bundler', '~> 2.0', :require => false                   # Capistrano bundler integration
  gem 'ed25519', '>= 1.2', '< 2.0'                                        # Resolve OpenSSH problems with capistrano
  gem 'rubocop', :require => false                                        # RuboCop
  gem 'rvm1-capistrano3', :require => false                               # Capistrano rvm integration
end
