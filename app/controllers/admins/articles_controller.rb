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
    if @article.is_published
      @user = User.find_by(role: "author")
      AuthorMailer.article_is_published(@article, @user).deliver_now
    else
       @user = User.find_by(role: "author")
      AuthorMailer.article_is_not_published(@article, @user).deliver_now
   end
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
