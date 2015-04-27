require 'dotenv/tasks'
require './bot.rb'
 
desc "Botterbot!"
task :bot do
  Bot.initialize
  Bot.go
end
 
task :default => 'bot'