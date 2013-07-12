project_path = "#{File.expand_path(File.join(File.dirname(__FILE__), '..'))}"
God.pid_file_directory = "#{project_path}/tmp/pids"

# load in all god configs
God.load "#{project_path}/config/god/*.god"