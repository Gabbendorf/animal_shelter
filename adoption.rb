require_relative 'shelter'

class Adoption

  attr_reader :animals_adopted, :shelter

  def initialize
    @animals_adopted = []
    @shelter = Shelter.new
  end

  def adopt(animal)
    animal_chosen = @shelter.animal_list.delete(animal)
    @animals_adopted << animal_chosen
  end

end
