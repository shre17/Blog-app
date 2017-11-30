class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, optional: true
  validates :title, presence: true,
                    length: { minimum: 5 }

  #   after_update :send_mail_to_author
  
  # def send_mail_to_author(user, article)
  #   @user = user
  #   @article = article
  #   @user = User.find_by(role: "author")
  #   if @article.is_published
  #    AuthorMailer.article_is_published(@article,@article.user).deliver_now
  #   else
  #     AuthorMailer.article_is_not_published(@article,@article.user).deliver_now
  #   end

  # end
end
