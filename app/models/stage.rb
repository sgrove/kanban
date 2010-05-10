class Stage < ActiveRecord::Base
  belongs_to :project
  has_many :cards
  
  def first?
    self == project.stages.first
  end
end
