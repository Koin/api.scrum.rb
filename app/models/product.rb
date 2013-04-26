class Product < ActiveRecord::Base
  validates :label, :presence => true
  has_many :stories, :sprints
end
