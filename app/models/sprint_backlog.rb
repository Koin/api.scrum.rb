class SprintBacklog < ActiveRecord::Base
  belongs_to :sprint
  belongs_to :story

  has_many :tasks

  validates :story_id, :uniqueness => {
    :scope => :sprint_id,
    :message => "already in this sprint"
  }
end
