Sidekiq.configure_server do |config|
  config.redis = { :namespace => 'jenkins_notifier' }
end

Sidekiq.configure_client do |config|
  config.redis = { :namespace => 'jenkins_notifier' }
end