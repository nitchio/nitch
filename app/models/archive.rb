class Archive < ActiveRecord::Base
  attr_accessible :title, :body

  validates_presence_of :title, :slug, :username, :body, :user_id, :nitch_id
  validates_uniqueness_of :slug, scope: [:user_id, :nitch_id]

  belongs_to :user
  belongs_to :nitch

  before_validation :generate_username
  before_validation :generate_slug

  def generate_username
    self.username ||= self.user.username if self.user
  end

  def generate_slug
    self.slug = title.parameterize
  end
end
