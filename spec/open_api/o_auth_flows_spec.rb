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
end
