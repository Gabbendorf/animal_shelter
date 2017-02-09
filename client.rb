class Client

attr_reader :full_name, :date_of_birth, :contact_details

  def initialize(full_name, date_of_birth, contact_details)
    @full_name = full_name
    @date_of_birth = date_of_birth
    @contact_details = contact_details
  end


end
