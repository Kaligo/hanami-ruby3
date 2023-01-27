require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc "Print out the gem version in gemspec file"
task :gem_version do
  puts Bundler.load_gemspec("hanami-ruby.gemspec").version.to_s
end
