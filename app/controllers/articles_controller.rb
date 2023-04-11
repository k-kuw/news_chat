class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :not_admin_user, except: %i[index show]

  # GET /articles or /articles.json
  def index
    @articles = if params[:id]
                  Article.where(category_id: params[:id]).page(params[:page]).per(4)
                else
                  Article.page(params[:page]).per(4)
                end
  end

  # GET /articles/1 or /articles/1.json
  def show
    @messages = Message.custom_display(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit; end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "追加しました"
      redirect_to root_path
    else
      flash.now[:fail] = '追加できませんでした、入力内容をご確認ください'
      render 'new', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    if @article.update(article_params)
      flash[:success] = "編集しました"
      redirect_to @article
    else
      flash[:fail] = '編集できませんでした、再度編集を行なってください'
      redirect_to edit_article_path
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    if @article.destroy
      flash[:success] = "削除しました"
      redirect_to root_path
    else
      flash.now[:fail] = '削除できませんでした、もう一度お試しください'
      render 'index', status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :description, :category_id)
  end

  def not_admin_user
    redirect_to root_path if !current_user || (current_user && !current_user.admin?)
  end
end
