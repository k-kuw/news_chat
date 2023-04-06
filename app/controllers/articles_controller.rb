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
  def show; end

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
      flash[:success] = "Success!"
      redirect_to root_path
    else
      flash.now[:fail] = 'There was something wrong '
      render 'new', status: :unprocessable_entity
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
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
