$:.unshift("/Library/RubyMotion/lib")
require 'motion/project'
require 'bundler/gem_tasks'
require 'bundler/setup'

$:.unshift("./lib/")
require './lib/velocity.rb'

require 'motion-colorize'

Motion::Project::App.setup do |app|
  app.name = 'velocity'
end
