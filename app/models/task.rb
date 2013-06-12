class Task < ActiveRecord::Base
  validates :label, :presence => true
  validates :point, :numericality => true, :allow_nil => true
  validates :order, :numericality => { :only_integer => true }, :allow_nil => true
  belongs_to :story
end
