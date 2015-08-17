class Chef < ActiveRecord::Base
  # has_many :comments, dependent: :destroy
  # belongs_to :user 
  # validates :title, presence: true, length: { minimum: 5 }
  has_many :recipes
  before_save {self.email = email.downcase}  #callback, the second self can be omitted
  validates :chefname, presence: true, length: {minimum: 3, maximum: 40}
  # VALID_EMAIL_REGEX = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105}, 
            uniqueness: { case_sensitive: false }, 
            format: {with: VALID_EMAIL_REGEX}
  

end
