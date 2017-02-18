require_relative 'client'

class ClientList

  attr_reader :list

  def initialize
    @list = [Client.new("Gabriella Medas", "06/09/1983", "gabriella@yahoo.it", "Tom")]
  end

  def add_client(full_name, date_of_birth, email_address, animals_adopted)
    @list << Client.new(full_name, date_of_birth, email_address, animals_adopted)
  end

end
