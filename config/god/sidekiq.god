rails_env = ENV['RAILS_ENV'] || "production"
project_path = "#{File.expand_path(File.join(File.dirname(__FILE__), '../..'))}"

application = "sidekiq"
group       = "jenkins_notifier"


God.watch do |w|
  w.dir      = "#{project_path}"
  w.name     = "#{group}:#{application}"
  w.group    = group
  w.interval = 30.seconds
  w.env      = { "RAILS_ENV" => rails_env }
  w.interval = 30.seconds
  w.start = "bundle exec #{application} -L #{project_path}/log/#{application}.log"

  # determine the state on startup
  w.transition(:init, { true => :up, false => :start }) do |on|
    on.condition(:process_running) do |c|
      c.running = true
    end
  end

  # determine when process has finished starting
  w.transition([:start, :restart], :up) do |on|
    on.condition(:process_running) do |c|
      c.running = true
      c.interval = 5.seconds
    end

    # failsafe
    on.condition(:tries) do |c|
      c.times = 5
      c.transition = :start
      c.interval = 5.seconds
    end
  end

  # start if process is not running
  w.transition(:up, :start) do |on|
    on.condition(:process_running) do |c|
      c.running = false
    end
  end
end