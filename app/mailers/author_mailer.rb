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

  # def notification_to_user(article, user)
  #   @article = article
  #   @user = user
  #   @url  = 'http://example.com/login'
  #   mail(to: @user.try(:email), subject: 'Welcome to My Awesome Site')
  # end
end
