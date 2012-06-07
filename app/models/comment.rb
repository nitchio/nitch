class Comment < ActiveRecord::Base
  attr_accessible :body

  validates_presence_of :key, :body, :user_id, :post_id, :archive_id

  belongs_to :user
  belongs_to :post
  belongs_to :archive

  has_ancestry cache_depth: true

  scope :roots, where(ancestry_depth: 0)

  before_validation :generate_key

  def generate_key
    self.key ||= Base62.encode(Time.now.to_i)
  end
end
