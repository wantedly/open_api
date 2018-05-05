RSpec.describe OpenApi::OAuthFlow do
  it "creates an instance" do
    expect(
      described_class.new(
        authorization_url: "https://example.com",
        token_url: "https://example.com",
        scopes: {
          "write:pets": "modify pets in your account",
          "read:pets": "read your pets"
        },
      )
    ).to be_a(described_class)
  end
end
