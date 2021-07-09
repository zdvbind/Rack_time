# frozen_string_literal: true

class TimeFormatter
  FORMAT_TIME = { year: '%Y', month: '%m', day: '%d', hour: '%Hh', minute: '%Mm', second: '%Ss' }.freeze

  def initialize(params)
    @params = params['format'].split(',')
    @valid_array = []
    @invalid_array = []
  end

  def processing
    @params.each do |format|
      FORMAT_TIME[format.to_sym] ? @valid_array << FORMAT_TIME[format.to_sym] : @invalid_array << format
    end
  end

  def valid_format?
    @invalid_array.empty?
  end

  def response_time
    Time.now.strftime(@valid_array.join('-'))
  end

  def responce_invalid_format
    @invalid_array
  end
end
