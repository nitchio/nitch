class Archive < ActiveRecord::Base
  attr_accessible :title, :body

  validates_presence_of :slug, :title, :body, :user_id, :nitch_id

  belongs_to :nitch, counter_cache: true
  belongs_to :user, counter_cache: true

  has_many :posts
  has_many :comments

  before_validation :generate_slug
  after_create :generate_key

  def generate_slug
    self.slug = title.parameterize
  end

  def generate_key
    update_attribute :key, 'a' + self.id.to_s(36)
  end
end
