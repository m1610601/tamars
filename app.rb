require 'bundler/setup'
Bundler.require
require 'sinatra/json'
require 'sinatra/reloader' if development?
require "./models"
require "date"
require 'bcrypt'
enable :sessions
require "twitter"

Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUD_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
end

get '/' do
  ua = request.user_agent
    @sp = 0
    @isAndroid = 0
    @isIOS = 0
    if ["Android"].find {|s| ua.include?(s) }
        @sp = 1
        @isAndroid = 1
    end
    if ["iPhone", "iPad", "iPod"].find {|s| ua.include?(s) }
        @sp = 1
        @isIOS = 1
    end

    if @sp == 1
      erb :index_sp, :layout => :layout_sp
    else
      erb :index
    end
end


def getTweet
  client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "CONSUMER_KEY"
    config.consumer_secret     = "CONSUMER_SECRET"
    config.access_token        = "ACCESS_TOKEN"
    config.access_token_secret = "ACCESS_TOKEN_SECRET"
  end

  # 取得するツイートの上限数
  limit   = 10

  # 欲しいハッシュタグのキーワード
  tag = "たまグラにいこう"

  # ここでツイートを取得
  @tweets =  client.search("##{tag}", lang: 'ja', result_type: 'recent', count: 1).take(limit)
end