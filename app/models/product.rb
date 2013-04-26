class Product < ActiveRecord::Base
  validates :label, :presence => true
  has_many :stories
  has_many :sprints
end
