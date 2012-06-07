class Nitch < ActiveRecord::Base
  include Redis::Objects

  attr_accessible :name, :title, :description, :privacy

  validates_presence_of :name, :title, :privacy
  validates_uniqueness_of :name, :title
  validates_exclusion_of :name, :in => Settings.reserved_subdomains
  validates_inclusion_of :privacy, :in => Settings.nitch_privacy

  has_settings

  has_many :archives

  after_create :set_defaults!

  def accessible_by?(user)
    return true if %w(public invite).include?(privacy)
    return true if user && has_user?(user)
    return false
  end

  def has_user?(user)
    return true if users.include?(user)
  end

  def set_defaults!
    self.settings.archive_name = 'Archive'
  end
end
