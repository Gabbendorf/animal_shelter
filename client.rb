class Client

attr_reader :full_name, :date_of_birth, :email_address

  def initialize(full_name, date_of_birth, email_address)
    @full_name = full_name
    @date_of_birth = date_of_birth
    @email_address = email_address
    # @animal = animal
  end


end
