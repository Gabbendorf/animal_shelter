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
end