require_relative 'animal'

class Shelter

  attr_reader :animal_list

  def initialize
    @animal_list = [Animal.new("Tom", 8, "cat"), Animal.new("Jerry", 9, "dog"), Animal.new("Garfield", 4, "hamster")]
  end

  def add_animal(name, age, type)
    @animal_list << Animal.new(name, age, type)
  end

  # def add_animal(animal)
  #   @animal_list << animal
  # end

  def in_shelter?(animal)
    @animal_list.include?(animal)
  end

  # def save_animal_list
  #   File.open("animal_list.txt", "w+") do |f|
  #     @animal_list.each { |element| f.puts(element) }
  #   end
  # end
end
