require_relative 'lib/game_of_life/rake_task'
require 'rspec/core/rake_task'

task :default do
  GameOfLife::RakeTask.new
end

task :gui do
  GameOfLife::RakeTask.new mode: :gui
end

task :spec do
  RSpec::Core::RakeTask.new
end
