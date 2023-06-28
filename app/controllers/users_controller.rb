class UsersController < ApplicationController
  def index
    # ユーザー一覧を表示するためのアクション
    @users = User.all
  end

  def show
    # 特定のユーザーを表示するためのアクション
    @user = User.find(params[:id])
  end

  def new
    # 新規ユーザー作成フォームを表示するためのアクション
    @user = User.new
  end

  def create
    # ユーザーを作成するためのアクション
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'ユーザーが作成されました'
    else
      render :new
    end
  end

  def edit
    # ユーザー編集フォームを表示するためのアクション
    @user = User.find(params[:id])
  end

  def update
    # ユーザーを更新するためのアクション
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザーが更新されました'
    else
      render :edit
    end
  end

  def destroy
    # ユーザーを削除するためのアクション
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'ユーザーが削除されました'
  end

  private

  def user_params
    # ユーザーパラメータを許可する
    params.require(:user).permit(:name, :email, :password)
  end
end