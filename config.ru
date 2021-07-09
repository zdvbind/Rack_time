# frozen_string_literal: true

require_relative 'middleware/check_url'
require_relative 'app'

use CheckUrl
run App.new
