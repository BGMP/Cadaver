# frozen_string_literal: true

lock '~> 3.17.1'

require 'capistrano/bundler'
require 'rvm1/capistrano3'

set :application, 'Cadaver'
set :repo_url, 'git@github.com:BGMP/Cadaver.git'
set :branch, 'master'
set :user, 'deploy'
set :stages, %w(production)
set :deploy_to, '/home/deploy/Cadaver'
set :linked_files, %w(config/config.yml)
set :linked_dirs, %w(.bundle)
set :pty, true
set :rvm1_ruby_version, '2.7.3'

namespace :app do
  task :update_rvm_key do
    execute :gpg, '--keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'
  end

  task :restart do
    on roles(:app) do
      execute :sudo, '/bin/systemctl restart cadaver.service'
    end
  end
end

before 'rvm1:install:rvm', 'app:update_rvm_key'
after 'deploy', 'app:restart'
