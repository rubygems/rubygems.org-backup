namespace :bluepill do
  set(:bluepill_options) { "--no-privileged -c #{deploy_to}/shared/bluepill" }
  set :bluepill_cmd, "bundle exec bluepill"

  desc "Stop processes that bluepill is monitoring and quit bluepill"
  task :quit, :roles => [:app] do
    run "cd #{current_path} && #{bluepill_cmd} stop #{bluepill_options}; true"
    run "cd #{current_path} && #{bluepill_cmd} quit #{bluepill_options}; true"
  end

  desc "Load bluepill configuration and start it"
  task :start, :roles => [:app] do
    run "cd #{current_path} && #{bluepill_cmd} load #{release_path}/config/pills/#{rails_env}.rb #{bluepill_options}"
  end

  desc "Prints bluepills monitored processes statuses"
  task :status, :roles => [:app] do
    run "cd #{current_path} && #{bluepill_cmd} status #{bluepill_options}"
  end
end

