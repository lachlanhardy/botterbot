require 'dotenv/tasks'
require './bot.rb'
 
desc "Botterbot!"
task :bot do
  Bot.initialize
  Bot.run
end
 
task :default => 'bot'