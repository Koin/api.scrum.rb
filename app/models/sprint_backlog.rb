class SprintBacklog < ActiveRecord::Base
  belongs_to :sprint
  belongs_to :story
end
