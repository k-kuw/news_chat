class UsersController < ApplicationController
  # 新規会員登録画面
  def new
    @user = User.new
  end

  # 新規会員登録
  def create
    # 許可されたパラメータ(user_params)での新規ユーザー作成
    @user = User.new(user_params)
    # 成功した場合
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "ようこそ！ #{@user.username}"
      redirect_to root_path
    # 失敗した場合
    else
      flash.now[:fail] = 'ログインに失敗しました。入力内容と既にご登録していないかご確認ください'
      render 'new', status: :unprocessable_entity
    end
  end

  private

  # 新規ユーザーパラメータの保存許可
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
