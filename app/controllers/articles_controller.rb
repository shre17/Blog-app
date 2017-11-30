class ArticlesController < ApplicationController

  load_and_authorize_resource
  
  before_action  only: [:show, :index]
  

def index
    @articles = Article.all
    @users = User.all
  end

def new
  @article = Article.new
end


def show
  @article = Article.find(params[:id])
end

def edit
  @article = Article.find(params[:id])
end


def create
  @article = Article.new(article_params)
  if @article.save
    AuthorMailer.new_article(@article, @article.user).deliver_now
    @user = User.find_by(role: "admin")
    AuthorMailer.new_article_notification(@user, @article, @article.user).deliver_now
    redirect_to @article
  else
    render 'new'
  end
end

  def load_article_comments
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def new_comment_section
    @article = Article.find(params[:id])
    @comments = @article.comments
  end

  def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to article_path(@article)
  else
    render 'edit'
  end
end

  def destroy
  @article = Article.find(params[:id])
  @article.destroy
 
  redirect_to articles_path
end

private
  def article_params
    params.require(:article).permit(:title, :text, :user_id)
  end


end
