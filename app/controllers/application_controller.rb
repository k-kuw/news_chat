class ApplicationController < ActionController::Base
  before_action :set_categories, :current_user
  def set_categories
    @categories = Category.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
