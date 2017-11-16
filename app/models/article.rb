class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }

  
  
  after_create :send_mail_to_all_user 
  # after_create :send_mail_to_author


  def send_mail_to_all_user
    User.take(1).each do |user|
    AuthorMailer.new_article(self, user).deliver_now
  end
end

# def send_mail_to_author
#     User.take(1).each do |admin|
#     AuthorMailer.article_is_published(self, admin).deliver_now
#     end
# end

end
