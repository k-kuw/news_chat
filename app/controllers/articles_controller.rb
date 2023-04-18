class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :not_admin_user, except: %i[index show]

  # トップ画面
  def index
    # カテゴリー選択時(params[:id]が存在する)、そのカテゴリーの記事のみ取得。そうでない場合は記事の全権取得
    @articles = if params[:id]
                  Article.where(category_id: params[:id]).order(created_at: "DESC").page(params[:page]).per(4)
                else
                  Article.order(created_at: "DESC").page(params[:page]).per(4)
                end
  end

  # 記事詳細画面
  def show
    @messages = Message.custom_display(params[:id])
  end

  # 記事新規作成画面
  def new
    @article = Article.new
  end

  # 記事編集画面
  def edit; end

  # 新規記事の追加
  def create
    # 許可されたパラメータ(article_params)で新規記事を保存
    @article = Article.new(article_params)
    # 保存が成功した場合
    if @article.save
      flash[:success] = "追加しました"
      redirect_to root_path
    # 保存が失敗した場合
    else
      flash.now[:fail] = '追加できませんでした、入力内容をご確認ください'
      render 'new', status: :unprocessable_entity
    end
  end

  # 記事編集
  def update
    # 許可されたパラメータ(article_params)で記事を変更
    # 成功した場合
    if @article.update(article_params)
      flash[:success] = "編集しました"
      redirect_to @article
    else
      # 失敗した場合
      flash[:fail] = '編集できませんでした、再度編集を行なってください'
      redirect_to edit_article_path
    end
  end

  # 記事削除
  def destroy
    # 成功した場合
    if @article.destroy
      flash[:success] = "削除しました"
      redirect_to root_path
      # 失敗した場合
    else
      flash.now[:fail] = '削除できませんでした、もう一度お試しください'
      render 'index', status: :unprocessable_entity
    end
  end

  private

  # 記事のインスタンス化
  def set_article
    @article = Article.find(params[:id])
  end

  # 記事パラメータの保存許可
  def article_params
    params.require(:article).permit(:title, :description, :category_id, :photo)
  end

  # 管理者ユーザーかどうか
  def not_admin_user
    redirect_to root_path if !current_user || (current_user && !current_user.admin?)
  end
end
