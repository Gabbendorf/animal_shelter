require_relative 'animal'
require_relative 'client'
# require_relative 'client_list'

class Shelter

  attr_reader :animal_list

  def initialize
    # @animal_list = []
    @animal_list = [Animal.new("Tom", 8, "cat"), Animal.new("Jerry", 9, "dog"), Animal.new("Garfield", 4, "hamster")]
  end

  def add_animal(name, age, type)
    @animal_list << Animal.new(name, age, type)
  end

  def in_shelter?(animal)
    if !@animal_list.include?(animal)
      false
    else
      animal
    end
  end

  def animal_by_name(animal_name)
    @animal_list.each do |animal|
      if animal.name == animal_name
        return animal
      end
    end
    return false
  end

  def adopt(animal, client)
    animal_deleted = @animal_list.delete(animal)
    client.animals_adopted << animal_deleted
  end

  # def save_animal_list
  #   File.open("animal_list.txt", "w+") do |f|
  #     @animal_list.each { |element| f.puts(element) }
  #   end
  # end
end
