class Character < ActiveRecord::Base
  
  before_validation :default_values
  before_create :add_abilities_to_character, :add_background, :add_aspect
  
  
  #belongs_to :player
  #belongs_to :race


  has_one :aspect, :dependent => :destroy
  has_one :background, :dependent => :destroy
  
  has_many :ability, :dependent => :destroy

  #has_many :character_class, :dependent => :destroy

  has_and_belongs_to_many :feat

  #has_many :possession, :dependent => :destroy
  has_many :skill, :dependent => :destroy
  has_many :skill_type, :through => :skill
  #has_many :spell, :dependent => :destroy


    accepts_nested_attributes_for :ability, :background, :aspect, :feat, :skill

    validates_presence_of :name
    
    validates_numericality_of :total_hit_points, :experience_points, :money 

private

  def default_values
    self.total_hit_points ||= 0
    self.experience_points ||= 0
    self.money ||= 0
  end

  def add_abilities_to_character
    self.ability.build(:name => :Strangth, :value => 10)
    self.ability.build(:name => :Dexterity, :value => 10)
    self.ability.build(:name => :Constitution, :value => 10)
    self.ability.build(:name => :Intelligence, :value => 10)
    self.ability.build(:name => :Wisdom, :value => 10)
    self.ability.build(:name => :Charisma, :value => 10)
  end

  def add_background
    self.build_background
  end

  def add_aspect
    self.build_aspect
  end
  

end