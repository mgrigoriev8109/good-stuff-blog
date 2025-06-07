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
end
