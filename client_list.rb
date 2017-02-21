require_relative 'client'

class ClientList

  attr_reader :list

  def initialize
    # @list = []
    @list = [Client.new("Gabriella Medas", "06/09/1983", "gabriella@yahoo.it")]
  end

  def add_client(full_name, date_of_birth, email_address)
    @list << Client.new(full_name, date_of_birth, email_address)
  end

  def existing_client?(client)
    if !list.include?(client)
      false
    else
      client
    end
  end

end
