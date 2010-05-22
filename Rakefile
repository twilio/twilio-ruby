require 'rubygems'
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s| 
  s.name = "twiliolib"
  s.version = "2.0.5"
  s.author = "Twilio"
  s.email = "help@twilio.com"
  s.homepage = "http://www.twilio.com/docs"
  s.description = "A Ruby gem for communicating with the Twilio API and generating TwiML"
  s.platform = Gem::Platform::RUBY
  s.summary = "A Ruby gem for communicating with the Twilio API and generating TwiML"
  s.files = FileList["{lib}/*"].to_a
  s.require_path = "lib"
  s.test_files = FileList["{test}/response_spec.rb"].to_a
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.markdown"]
  s.add_dependency("builder", ">= 2.1.2")
end
 
Rake::GemPackageTask.new(spec) do |pkg| 
  pkg.need_tar = true 
end 

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
    puts "generated latest version"
end
