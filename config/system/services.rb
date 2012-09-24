Bluepill.application("rubygems") do |app|
  app.process("stat-update") do |process|
    process.start_command = "/usr/local/bin/stat-update -h 'http://staging.cf.rubygems.org/gems/'"
    process.pid_file = "/var/run/stat-update.pid"
    process.stdout = process.stderr = "/var/log/stat-update.log"
    process.daemonize = true
  end
end

