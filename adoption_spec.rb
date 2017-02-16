require_relative 'adoption'

RSpec.describe Adoption do

  let(:adoption) {Adoption.new}

  it "adds the animal chosen by user into list" do
    adoption.add_adopted_animal("Tom")
    expect(adoption.animals_adopted.length).to eq(1)
  end

end
