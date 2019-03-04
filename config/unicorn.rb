worker_processes Integer(ENV['WEB_CONCURRENCY'] || 2)
timeout 15
preload_app true
listen(ENV['PORT'] || 3000, :backlog => Integer(ENV['UNICORN_BACKLOG'] || 200))

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(Sequel::Model)
    Sequel::DATABASES.each { |db| db.disconnect }
  end
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to sent QUIT'
  end
end
