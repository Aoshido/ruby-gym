class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @articles = Article.paginate :page => params[:page], :per_page => 5
  end

  def create
    @article = Article.new(article_params)
    @articles = Article.paginate :page => params[:page], :per_page => 5
    binding.pry
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity, articles: @articles
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
