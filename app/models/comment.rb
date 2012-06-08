class Comment < ActiveRecord::Base
  attr_accessible :body

  validates_presence_of :body, :user_id, :post_id, :archive_id, :nitch_id

  belongs_to :post, counter_cache: true
  belongs_to :archive, counter_cache: true
  belongs_to :nitch, counter_cache: true
  belongs_to :user, counter_cache: true

  has_ancestry cache_depth: true

  scope :roots, where(ancestry_depth: 0)

  after_create :generate_key

  def generate_key
    update_attribute :key, 'c' + self.id.to_s(36)
  end
end
