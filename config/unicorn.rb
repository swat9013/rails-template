# frozen_string_literal: true
rails_root = File.expand_path("../../../", __FILE__)

worker_processes 3
listen "#{rails_root}/tmp/sockets/unicorn.sock"
pid "#{rails_root}/tmp/pids/unicorn.pid"

preload_app true

stdout_path "#{rails_root}/log/unicorn_stdout.log"
stderr_path "#{rails_root}/log/unicorn_stderr.log"

before_exec do |_server|
  ENV["BUNDLE_GEMFILE"] = "#{rails_root}/Gemfile"
end

before_fork do |server, _worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

  # Before forking, kill the master process that belongs to the .oldbin PID.
  # This enables 0 downtime deploys.
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
      Rails.logger.info "unicorn restart error"
    end
  end
end

after_fork do |_server, _worker|
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end
