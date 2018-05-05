RSpec.describe OpenApi::SecuritySchema do
  it "creaates an instance" do
    expect(
      described_class.new(
        type: "http",
        scheme: "basic",
        in: nil,
        name: nil,
        flows: nil,
        open_id_connect_url: nil,
      )
    ).to be_a(described_class)
  end
end
