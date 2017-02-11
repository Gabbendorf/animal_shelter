require_relative 'client'

class ClientList

  attr_reader :list

  def initialize
    @list = []
  end

  def add_client(full_name, date_of_birth, email_address)
    @list << Client.new(full_name, date_of_birth, email_address)

  end

end
