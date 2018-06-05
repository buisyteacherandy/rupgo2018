# config valid only for current version of Capistrano
lock "~> 3.10.2"

set :application, 'rupgo2018'
set :repo_url, 'git@github.com:buisyteacherandy/rupgo2018.git'
set :branch, :master
set :deploy_to, '/home/ubuntu/rupgo2018'
set :tmp_dir, "/home/ubuntu/tmp"
append :linked_files, "config/database.yml", "config/secrets.yml"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}
set :copy_exclude, [".git", "spec"]

namespace :deploy do

 desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

 desc 'DB Seeds'
  task :seed do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:seed'
        end
      end
    end
  end

 desc 'DB Purge'
  task :purge do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:purge'
        end
      end
    end
  end

 desc 'DB Migrate'
  task :migrate do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:migrate'
        end
      end
    end
  end

 desc 'DB Reset'
  task :reset do
    on primary fetch(:migration_role) do
      within release_path do
        with rails_env: fetch(:rails_env)  do
          execute :rake, 'db:reset DATABASE DISABLE_DATABASE_ENVIRONMENT_CHECK=1'
        end
      end
    end
  end

 task :logs, :file do |t, args|
    if args[:file]
      on roles(:app) do
        execute "tail -f #{shared_path}/log/#{args[:file]}.log"
      end
    else
      puts "please specify a logfile e.g: 'rake logs:tail[logfile]"
      puts "will tail 'shared_path/log/logfile.log'"
      puts "remember if you use zsh you'll need to format it as:"
      puts "rake 'logs:tail[logfile]' (single quotes)"
    end
  end

 after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end

set :default_env, { "SECRET_KEY_BASE" => "XXXX", "RUPGO_DATABASE_PASSWORD" => "rupgo_password" }
