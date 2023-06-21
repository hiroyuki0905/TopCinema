class TweetsController < ApplicationController
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path # ランキング投稿後にトップページにリダイレクトする
    else
      render :new
    end
  end

  def index
    @tweets = Tweet.all
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :rank)
  end
end