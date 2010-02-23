class Project < ActiveRecord::Base

  has_many :stages
  # has_many :cards, :through => :stages

  before_save :update_permalink

  def to_param
    [id, permalink].join('-')
  end

protected

  def update_permalink
    self.permalink = name.downcase.gsub(/['"]/,'').gsub(/[^a-z0-9]/,'-').gsub(/\-+/,'-')
  end

end
