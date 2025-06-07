class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    # the :id can be accessed in this show function
    # via params[], due to the fact that inside the routes.rb
    # file we stated get "/articles/:id", which gives the function
    # access to whichever id we pass in via the url
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
