# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

task default: %w[lint test]

Rake::TestTask.new do |task|
  task.libs << 'test'
  task.test_files = FileList['test/**/*_test.rb']
end

RuboCop::RakeTask.new(:lint) do |task|
  task.patterns = ['lib/**/*.rb', 'test/**/*.rb']
  task.fail_on_error = false
end
