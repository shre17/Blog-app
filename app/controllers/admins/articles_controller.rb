class Admins::ArticlesController < ApplicationController
 

def index
    @articles = Article.all
  end

def show
  @article = Article.find(params[:id])

end

  def new
    @article = Article.new
  end

  def edit
  @article = Article.find(params[:id])
end



def create
  @article = Article.new(article_params)
 
  if @article.save
    redirect_to admins_article_path(@article)
  else
    render 'new'
  end
end

def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to admins_article_path(@article)
  else
    render 'edit'
  end
end

def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to admins_articles_path
end


# for reuse in the same contoller
private
  def article_params
    params.require(:article).permit(:title, :text, :is_published)
  end

end
