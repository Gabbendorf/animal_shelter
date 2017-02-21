require_relative 'client_list'

RSpec.describe ClientList do

  let(:client_list) {ClientList.new}

  it "returns an empty list" do
    expect(client_list.list).to eq([])
  end

  it "adds a client" do
    client_list.add_client("John", "12/04/1958", "john@gmail.com", "no animals")
    expect(client_list.list.length).to eq(1)
  end

  it "returns the client if this exists" do
    client_list.add_client("John", "12/04/1958", "john@gmail.com", "no animals")
    client = client_list.list[0]
    expect(client_list.existing_client?(client)).to eq(client)
  end

end
