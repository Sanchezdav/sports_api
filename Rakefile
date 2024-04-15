# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'

task default: %w[test]

Rake::TestTask.new do |task|
  task.libs << 'test'
  task.test_files = FileList['test/**/*_test.rb']
end
