class Sprint < ActiveRecord::Base
  validates :start_date, :date => true, :presence => true
  validates :end_date, :date => { :after => :start_date }, :presence => true
  belongs_to :product
  has_many :sprint_backlogs
  has_many :stories, :through => :sprint_backlogs
end
