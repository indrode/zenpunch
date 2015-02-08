root = "/home/akira/zenpunch"
daemonize true
bind "unix://#{root}/tmp/socket"
pidfile "#{root}/tmp/pid"
state_path "#{root}/tmp/state"
rackup "#{root}/current/config.ru"

threads 2, 4

activate_control_app
