class Post < ActiveRecord::Base
  attr_accessible :title, :body

  validates_presence_of :slug, :title, :body, :user_id, :nitch_id, :archive_id

  belongs_to :archive, counter_cache: true
  belongs_to :nitch, counter_cache: true
  belongs_to :user, counter_cache: true

  has_many :comments

  before_validation :generate_slug
  after_create :generate_key

  def generate_slug
    self.slug = (self.title.length > 50 ? self.title[0..49] : self.title).parameterize
  end

  def generate_key
    update_attribute :key, 'p' + self.id.to_s(36)
  end
end
