require_relative 'animal'

class Shelter

  attr_reader :animal_list

  def initialize
    @animal_list = []
  end

  def add_animal(name, age, type)
    @animal_list << Animal.new(name, age, type)
  end
end
