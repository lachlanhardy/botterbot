require 'rubygems'
require 'dotenv'
require 'bundler/setup'
Bundler.require
Dotenv.load
 
class Bot
  def self.initialize
    config = {
      :consumer_key        => ENV['TWITTER_CONSUMER_KEY'],
      :consumer_secret     => ENV['TWITTER_CONSUMER_SECRET'],
      :access_token        => ENV['TWITTER_ACCESS_TOKEN'],
      :access_token_secret => ENV['TWITTER_ACCESS_TOKEN_SECRET']
    }
    @bot = Twitter::REST::Client.new(config)
    @stream = Twitter::Streaming::Client.new(config)
  end

  def self.run
    while true
      begin 
        # topics to watch
        topics = ['tony abbott']
        @stream.filter(:track => topics.join(',')) do |tweet|
          if tweet.is_a?(Twitter::Tweet) && !tweet.text.match(/^RT/) && tweet.lang == 'en'
            p "@#{tweet.user.screen_name}: #{tweet.text} (ID: #{tweet.id}) (#{tweet.lang})"
            @bot.fav tweet
          end
        end
      rescue Exception => e
        puts 'error occurred, waiting for 5 seconds: ' + e.class.to_s
        sleep 5
      end
    end
  end
end