class ErrorsController < ApplicationController

  layout 'errors'

  def not_found
    begin
      title = "Error 404 - not found test 2"
      exception = request.env['action_dispatch.exception']
      message = exception.message.to_s
      source_extract = ""
      backtrace = exception.backtrace[0..9].join("\n")
      Slack::SlackNotifyErrorJob.perform_later(title, message, source_extract, backtrace)
    ensure
      render(:status => 404)
    end
  end

  def unnacceptable
    render(:status => 422)
  end

  def internal_error
    begin
      title = "Error 500 - internal error"
      exception = request.env['action_dispatch.exception']


      if exception.respond_to?(:source_extract)
        message = exception.message.to_s
        source_extract = exception.source_extract.join("\n")
        backtrace = exception.backtrace[0..9].join("\n")
      else
        message = exception.message.to_s
        source_extract = "Not found"
        backtrace = exception.backtrace[0..9].join("\n")
      end

      Slack::SlackNotifyErrorJob.perform_later(title, message, source_extract, backtrace)
    ensure
      render(:status => 500)
    end
  end

end
