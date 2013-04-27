class Task < ActiveRecord::Base
  validates :label, :presence => true
  belongs_to :sprint_backlog
end
