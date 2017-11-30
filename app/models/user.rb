class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :articles, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[admin user author].freeze

   def admin?      
    self.role == "admin" 
   end 

  def user?  
    self.role == "user"   
  end

  def author?
    self.role == "author"
  end

end

