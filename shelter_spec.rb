require_relative 'shelter'

RSpec.describe Shelter do

  let(:shelter) {Shelter.new}

  it "returns an empty list" do
    expect(shelter.animal_list).to eq([])
  end

  it "adds the animal to the list" do
    shelter.add_animal("John", 6, "Dog")
    expect(shelter.animal_list.length).to eq(1)
    first_animal = shelter.animal_list[0]
    expect(first_animal.name).to eq("John")
    expect(first_animal.age).to eq(6)
    expect(first_animal.type).to eq("Dog")
  end

  xit "confirms the animal is in the shelter" do
    shelter.add_animal("John", 6, "Dog")
    animal = shelter.animal_list[0]
    expect(shelter.in_shelter?(animal)).to eq(true)
  end

  it "confirms the animal is not in the shelter" do
    animal = shelter.animal_list[0]
    expect(shelter.in_shelter?(animal)).to eq(false)
  end

  it "returns the animal if this is in the shelter" do
    shelter.add_animal("John", 6, "Dog")
    animal = shelter.animal_list[0]
    expect(shelter.in_shelter?(animal)).to eq(animal)
  end

  it "removes the animal" do
    shelter.add_animal("John", 6, "Dog")
    added_animal = shelter.animal_by_name("John")
    shelter.remove_animal(added_animal)
    expect(shelter.animal_list.length).to eq(0)
  end

  it "returns the animal by name if it's in shelter" do
    shelter.add_animal("John", 6, "Dog")
    retrieved_animal = shelter.animal_by_name("John")
    expect(retrieved_animal.name).to eq("John")
    expect(retrieved_animal.age).to eq(6)
    expect(retrieved_animal.type).to eq("Dog")
  end

  it "returns false if the animal by name it's not in shelter" do
    retrieved_animal = shelter.animal_by_name("Wallie")
    expect(retrieved_animal).to eq(false)
  end

  it "removes animal from shelter when adopting" do
    
  end

end
