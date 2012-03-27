class SkillType < ActiveRecord::Base
  
  has_many :skill
  
  validates :name, :modifier_type, :presence => true
  
  validates_length_of :modifier_type, :is => 3
end