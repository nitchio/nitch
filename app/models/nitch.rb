class Nitch < ActiveRecord::Base
  @@privacy = %w(Public Restricted Private)

  attr_accessible :name, :title, :privacy

  validates_presence_of :name, :title, :privacy
  validates_uniqueness_of :name, :title
end
