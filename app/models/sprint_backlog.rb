class SprintBacklog < ActiveRecord::Base
  validates :story_id, :uniqueness => {
    :scope => :sprint_id,
    :message => "already in this sprint"
  }
  validates :order, :numericality => { :only_integer => true }, :allow_nil => true
  belongs_to :sprint
  belongs_to :story
end
