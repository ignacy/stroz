require 'capistrano/ext/multistage'

set :stages, ["staging", "production"]
set :default_stage, "production"
set :ssh_options, { forward_agent: true }
set :keep_releases, 5
set :repository_cache, "git_cache"
set :deploy_via, :remote_cache
set :application, "Stroz"
set :repository,  "https://github.com/ignacy/stroz.git"
set :scm, :git
set :branch, :master
set :use_sudo, false

set :normalize_asset_timestamps, false
set :deploy_via, :remote_cache

after "deploy:update", "deploy:cleanup"

after "deploy:update", "deploy:build", "deploy:cleanup"

namespace :assets do
  task :precompile, roles: :web do
    # do nothing
  end
end

def is_application_running?(current_path)
  pid = capture(%Q{ps ax -o pid= -o command=|
      grep "/home/ubuntu/www/stroz/current/rel/stroz/.*/[b]eam"|awk '{print $1}'})
  return pid != ""
end

namespace :deploy do
  task :is_running, roles: :web do
    is_running = is_application_running?(current_path)
    if is_running
      puts "Application is running"
    else
      puts "Application is NOT running"
    end
  end

  task :build, roles: :web do
    run "ln -s #{shared_path}/config/prod.secret.exs #{current_path}/config/prod.secret.exs"
    run "cd #{current_path} && mix deps.get && MIX_ENV=#{mix_env} mix release"
  end

  task :restart, roles: :web do
    if is_application_running?(current_path)
      run "cd #{current_path}/rel/stroz/bin && ./stroz stop"
    end
    run "cd #{current_path}/rel/stroz/bin && ./stroz start"
  end

  task :start, roles: :web do
    run "cd #{current_path}/rel/stroz/bin && ./stroz start"
  end

  task :stop, roles: :web do
    run "cd #{current_path}/rel/stroz/bin && ./stroz stop"
  end
end
