require_relative "./ruby3/version"

require "hanami"

Dir[
  "#{__dir__}/ruby3/hanami/**/*.rb",
  "#{__dir__}/v1/**/*.rb"
].each do |f|
  require_relative f
end

module Hanami
  module Ruby3; end
end
