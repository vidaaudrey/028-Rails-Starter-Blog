class User < ActiveRecord::Base
  has_many :articles
  validates :username, presence: true,
                    length: { minimum: 5 }
end
