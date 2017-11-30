class Slack::SlackNotifyErrorJob < ApplicationJob
  queue_as :default

  def perform(error_title, error_message, source_extract, backtrace)
    error = "#{error_title}"
    message = ""
    message << "*#{error}*\n"
    message << "*Date:* #{Time.now}\n"
    message << "*Error:* ```#{error_message}```"
    message << "*Source:* ```#{source_extract}```"
    message << "*Backtrace:* ```#{backtrace}```"
    notifier = Slack::Notifier.new Rails.application.secrets.slack_url
    notifier.ping message, username: '091Error', channel: '#debugger'
  end
end
