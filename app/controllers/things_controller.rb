require 'open-uri'

class ThingsController < ApplicationController
  
  before_filter :login_required, :only => :new
  
  def new
    @thing = current_user.things.new
    @categories = Category.all
  end
  
  def show
    @thing = Thing.find(params[:id])
  end
  
  def create
    @thing = current_user.things.new(params[:thing])
    if @thing.save
      if params[:tweet_it]
        url = url_for(@thing)
        bitly = open("http://api.bit.ly/shorten?version=2.0.1&longUrl=#{CGI::escape(url)}&login=#{BITLY_LOGIN}&apiKey=#{BITLY_API_KEY}").read
        bitly = ActiveResource::Formats::JsonFormat.decode(bitly)
        short_url = bitly['results'].values.first['shortUrl']
        tweet = "#{@thing.text} (#{@thing.points} pts) #edot #{short_url}"
        logger.warn "tweeting! #{tweet}"
        current_user.twitter.post('/statuses/update.json', 'status' => tweet)
      end
      flash[:message] = "You did a thing!"
      redirect_to root_path
    else
      @categories = Category.all
      render :new
    end
  end
  
end
