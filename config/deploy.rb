require 'capi/unicorn'
require "rvm/capistrano"

set :application, "i_am_the_lider"
set :rails_env,      "development"
# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :rvm_type, :user

role :web, "ulgood.ru"

set :user, "user"  # The server's user for deploys

set :use_sudo, false

set :rake, "#{rake} --trace"
set :app_dir, "/srv/#{application}"
set :current_path, "#{app_dir}/current"
set :deploy_to, "#{app_dir}"

set :ssh_options, { :forward_agent => true }
default_run_options[:pty] = true

set :repository, "https://github.com/ulmic/i_am_the_lider.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache

desc "Seed database data"
task :seed_data do
  run "cd #{current_path} && RAILS_ENV=#{rails_env} #{rake} db:seed"
end

namespace :db do
  desc "Symlink to sqlite db"
  task :symlink do
    run "cd #{current_path}/db && ln -s #{app_dir}/shared/db/development.sqlite3"
  end
end

after 'deploy:create_symlink', 'db:symlink'
require 'capistrano_colors'