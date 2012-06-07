class Archive < ActiveRecord::Base
  attr_accessible :title, :body

  validates_presence_of :slug, :key, :title, :body, :user_id, :nitch_id

  belongs_to :user
  belongs_to :nitch

  has_many :posts

  before_validation :generate_key
  before_validation :generate_slug

  def generate_key
    self.key ||= Base62.encode(Time.now.to_i)
  end

  def generate_slug
    self.slug = title.parameterize
  end
end
