class User < ActiveRecord::Base
  acts_as_authentic

  attr_accessible :username, :email, :password, :password_confirmation

  # has_and_belongs_to_many :nitches
  has_many :archives
  has_many :posts
  has_many :comments

  def self.find_by_username_or_email(login)
    User.find_by_username(login) || User.find_by_email(login)
  end
end
