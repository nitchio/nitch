class Post < ActiveRecord::Base
  attr_accessible :title, :body

  validates_presence_of :slug, :key, :title, :body, :user_id, :nitch_id, :archive_id

  belongs_to :user
  belongs_to :nitch
  belongs_to :archive

  has_many :comments

  before_validation :generate_key
  before_validation :generate_slug

  def generate_key
    self.key ||= Base62.encode(Time.now.to_i)
  end

  def generate_slug
    self.slug = (self.title.length > 50 ? self.title[0..49] : self.title).parameterize
  end
end
