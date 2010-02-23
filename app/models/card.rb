class Card < ActiveRecord::Base

  before_create :set_project_from_stage

  belongs_to :project
  belongs_to :stage

protected

  def set_project_from_stage
    self.project = stage.project if project.blank? && stage.present?
  end
  
end

