require_relative 'validations'

RSpec.describe Validations do
let(:output) {StringIO.new}
# add this for each test individually
let(:input) {StringIO.new("yes\n1\ndd@dd.dd\n06/09/1983\nGabriella Medas\nGarfield")}
let(:ui) {Ui.new(input, output)}
let(:validations) {Validations.new(ui)}

  it "returns the menu number if the user's input is true" do
    expect(validations.validate_option_chosen("4")).to eq(4)
  end

  it "outputs a message for the user if the menu number is wrong" do
    # @input = StringIO.new("0\n")
    validations.validate_option_chosen("9")
    expect(output.string).to include("Option not available. Please enter a valid option.")
  end

  it "returns the entered age if this is a valid number" do
    expect(validations.validate_animal_age("8")).to eq(8)
  end

  it "outputs a message for the user if the age is not valid" do
    # @input = StringIO.new("9\n")
    validations.validate_animal_age("d")
    expect(output.string).to include("The age must be a valid number.")
  end

  it "outputs a message for the user if his reply is different from yes or no" do
    validations.validate_yes_replies("ok")
    expect(output.string).to include("This input is wrong. Please reply with \"yes\" or \"no\"")
  end

  it "returns the user's reply only if this is 'yes' or 'no'" do
    expect(validations.validate_yes_replies("yes")).to eq("yes")
  end

  it "outputs a message for the user if the email address is in a wrong format" do
    validations.validate_email_address("dd@dd")
    expect(output.string).to include("Please enter a valid email address.")
  end

  it "returns the user's email address if this is correct" do
    expect(validations.validate_email_address("dd@dd.dd")).to eq("dd@dd.dd")
  end

  it "outputs a message for the user if the date of birth format is incorrect" do
    validations.validate_date_of_birth("06/09/2030")
    expect(output.string).to include("The date of birth should be in a valid format (dd/mm/yyyy).")
  end

  it "returns the user's date of birth if this is in the correct format" do
    expect(validations.validate_date_of_birth("06/09/1983")).to eq("06/09/1983")
  end

  it "returns the user's name if it has more than 1 word" do
    expect(validations.validate_user_name("Gabriella Medas")).to eq("Gabriella Medas")
  end

  it "outputs a message for the user if the name has less than 2 words" do
    validations.validate_user_name("Gabriella")
    expect(output.string).to include("Please enter a full valid name (first name, middle name if any, surname).")
  end

  it "returns the animal name if it is not an empty string" do
    expect(validations.validate_animal_name("Garfield")).to eq("Garfield")
  end

  it "outputs a message for the user if the animal name is an empty string" do
    validations.validate_animal_name("\n")
    expect(output.string).to include("Please enter a name for the animal to add:")
  end

end
