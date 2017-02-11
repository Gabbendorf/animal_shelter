require_relative 'validations'

RSpec.describe Validations do
let(:output) {StringIO.new}
let(:input) {StringIO.new("0")}
let(:ui) {Ui.new(input, output)}
let(:validations) {Validations.new(ui)}

  it "returns the option number if the user's input is true" do
    expect(validations.validate_option_chosen("4")).to eq(4)
  end

  it "asks to enter a valid option if the user's input is not valid" do
    # input = StringIO.new("8\n4")
    validations.validate_option_chosen(9)
    expect(output.string).to include("Option not available. Please enter a valid option.")
  end

  it "returns the entered age if this is a valid number" do
    expect(validations.validate_age("8")).to eq(8)
  end

  it "returns the user's reply only if this is 'yes' or 'no'" do
    expect(validations.validate_yes_replies("yes")).to eq("yes")
  end

  it "returns the user's email address if this is correct" do
    expect(validations.validate_email_address("dd@dd.dd")).to eq("dd@dd.dd")
  end

end
