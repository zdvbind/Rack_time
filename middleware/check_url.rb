# frozen_string_literal: true

class CheckUrl
  def initialize(app)
    @app = app
  end

  def call(env)
    @request = Rack::Request.new(env)
    if @request.path_info == "/time" && @request.request_method == "GET"
      @app.call(env)
    else
      [404, { 'Content-Type' => 'text/plain' }, ["Not Found\n"]]
    end
  end
end
