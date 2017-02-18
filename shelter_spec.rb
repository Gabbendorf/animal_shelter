require_relative 'shelter'

RSpec.describe Shelter do

  let(:shelter) {Shelter.new}

  # it "returns an empty list" do
  #   expect(shelter.animal_list).to eq([])
  # end

  it "adds the animal to the list" do
    animal = Animal.new("John", 6, "Dog")
    shelter.add_animal(animal)
    expect(shelter.animal_list.length).to eq(4)
    first_animal = shelter.animal_list[3]
    expect(first_animal.name).to eq("John")
    expect(first_animal.age).to eq(6)
    expect(first_animal.type).to eq("Dog")
  end

  it "confirms the animal is in the shelter" do
    animal = Animal.new("John", 6, "Dog")
    shelter.add_animal(animal)
    expect(shelter.in_shelter?(animal)).to eq(true)
  end

  it "confirms the animal is not in the shelter" do
    animal = Animal.new("Ginger", 2, "cat")
    expect(shelter.in_shelter?(animal)).to eq(false)
  end

end
