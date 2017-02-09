require_relative 'client_list'

RSpec.describe ClientList do

  let(:client_list) {ClientList.new}

  it "returns an empty list" do
    expect(client_list.list).to eq([])
  end

  it "adds a client" do
    client_list.add_client("John", 3402701624, "john@gmail.com")
    expect(client_list.list.length).to eq(1)
  end

end
