# Preview all emails at http://localhost:3000/rails/mailers/author_mailer
class AuthorMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/author_mailer/new_article
  def new_article
    AuthorMailer.new_article
  end

end
