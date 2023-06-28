class UsersController < ApplicationController
  def show
    user = User.find_by(id: params[:id])

    if user
      @nickname = user.nickname
      @tweets = user.tweets
    else
      redirect_to new_user_session_path, notice: 'ユーザーが見つかりません'
    end
  end
end

