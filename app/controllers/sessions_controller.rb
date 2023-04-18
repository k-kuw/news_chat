class SessionsController < ApplicationController
  # ログイン画面
  def new; end

  # ログイン
  def create
    # 入力されたemailとデータの比較
    user = User.find_by(email: params[:session][:email].downcase)
    # 入力されたemail, passwordがデータと一致した場合
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'ログインに成功しました'
      redirect_to root_path
    # 入力が一致しなかった場合
    else
      flash.now[:fail] = 'メースアドレスかパスワードに誤りがあります。もう一度お試しください'
      render 'new', status: :unprocessable_entity
    end
  end

  # ログアウト
  def destroy
    session[:user_id] = nil
    flash[:success] = "ログアウトしました"
    redirect_to root_path
  end
end
