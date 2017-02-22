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

  def client_by_name(client_name)
    @list.each do |client|
      if client.full_name == client_name
        return client
      end
    end
    false
  end

end
