# frozen_string_literal: true

Dir[File.join(__dir__, 'framework/rest/*.rb')].sort.each do |file|
  require file
end

Dir[File.join(__dir__, 'rest/*.rb')].sort.each do |file|
  require file
end

Dir[File.join(__dir__, 'rest/**/*.rb')].sort.each do |file|
  require file
end
