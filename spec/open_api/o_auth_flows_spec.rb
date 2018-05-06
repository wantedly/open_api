RSpec.describe OpenApi::OAuthFlows do
  it "creates an instance" do
    expect(
      described_class.new(
        implicit: double(:o_atuh_flow),
        password: double(:o_auth_flow),
        client_credentials: double(:o_atuh_flow),
        authorization_code: double(:o_atuh_flow),
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "implicit" => flow_hash,
        "password" => flow_hash,
        "clientCredentials" => flow_hash,
        "authorizationCode" => flow_hash,
      }
    end
    let(:flow_hash) { double(:hash) }
    let(:flow) { double(:o_auth_flow) }

    before do
      allow(OpenApi::OAuthFlow).to receive(:load).with(flow_hash).and_return(flow)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        implicit: flow,
        password: flow,
        client_credentials: flow,
        authorization_code: flow,
      )
    end
  end
end
