class Sprint < ActiveRecord::Base
  belongs_to :product
  has_many :sprint_backlogs
  has_many :stories, :through => :sprint_backlogs
end
