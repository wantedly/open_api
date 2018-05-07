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

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "type" => "http",
        "scheme" => "basic",
        "in" => "header",
        "name" => "foo",
        "flows" => flows_hash,
        "openIdConnectUrl" => "https://example.com",
      }
    end
    let(:flows_hash) { double(:hash) }
    let(:flows) { double(:o_auth_flows) }

    before do
      allow(OpenApi::OAuthFlows).to receive(:load).with(flows_hash).and_return(flows)
    end

    it "cretes an instance from name" do
      is_expected.to eq described_class.new(
        type: "http",
        scheme: "basic",
        in: "header",
        name: "foo",
        flows: flows,
        open_id_connect_url: "https://example.com",
      )
    end
  end
end
