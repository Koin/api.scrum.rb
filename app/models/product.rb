class Product < ActiveRecord::Base
  validates :label, :presence => true
end
