class Nitch < ActiveRecord::Base
  attr_accessible :name, :title, :description, :privacy

  validates_presence_of :name, :title, :privacy
  validates_uniqueness_of :name, :title
  validates_exclusion_of :name, :in => Settings.reserved_subdomains
  validates_inclusion_of :privacy, :in => Settings.nitch_privacy

  has_and_belongs_to_many :users
  # has_and_belongs_to_many :invite_requests

  def accessible_by?(user)
    # determine accessibility later
    return true if privacy == 'public'
    return true if users.include?(user)
  end
end
