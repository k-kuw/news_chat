class ApplicationController < ActionController::Base
  before_action :set_categories, :current_user
  # カテゴリーデータ取得
  def set_categories
    @categories = Category.all
  end

  # ログインユーザー照会
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
