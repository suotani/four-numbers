class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.new(memo: params[:memo])
    @result = @tweet.save
  end
end