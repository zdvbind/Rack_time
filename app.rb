# frozen_string_literal: true

require_relative 'processing_request'

class App
  def call(env)
    @request = Rack::Request.new(env)
    request_preprocessing
  end

  private

  def request_preprocessing
    formatter = TimeFormatter.new(@request.params)
    formatter.processing
    if formatter.valid_format?
      response(200, formatter.response_time)
    else
      response(400, "Unknown time format #{formatter.responce_invalid_format}")
    end
  end

  def response(code, body)
    response = Rack::Response.new(
      body,
      code,
      { 'Content-Type' => 'text/plain' }
    )
    response.finish
  end
end
