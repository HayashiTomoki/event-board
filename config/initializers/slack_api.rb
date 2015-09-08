require 'slack'

Slack.configure do |config|
  config.token = ENV['SlackAPItoken']
end