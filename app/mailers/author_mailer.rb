class AuthorMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.author_mailer.new_article.subject
  #
  def new_article(article, user)
    @article = article
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.try(:email), subject: 'Welcome to My Awesome Site')
  end

  def new_article_notification(user, article, author)
    @user = user
    @author = author
    @article = article
    @url  = 'http://example.com/login'
    mail(to: @user.try(:email), subject: 'Welcome to My Awesome Site')
  end

  def article_is_published(article, user)
    @article = article
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.try(:email), subject: 'Your article is published')
  end

  def article_is_not_published(article, user)
    @article = article
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.try(:email), subject: 'Your article is not published')
  end

end
