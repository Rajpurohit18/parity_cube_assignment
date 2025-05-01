# config/unicorn.rb

worker_processes 2
working_directory "/app"

listen 8081
timeout 30
pid "/app/tmp/pids/unicorn.pid"

stderr_path "/app/log/unicorn.stderr.log"
stdout_path "/app/log/unicorn.stdout.log"

