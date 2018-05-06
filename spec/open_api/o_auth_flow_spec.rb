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

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "authorizationUrl" => "https://example.com",
        "tokenUrl" => "https://example.com",
        "scopes" => {
          "write:pets": "modify pets in your account",
          "read:pets": "read your pets"
        }
      }
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        authorization_url: "https://example.com",
        token_url: "https://example.com",
        scopes: {
          "write:pets": "modify pets in your account",
          "read:pets": "read your pets"
        },
      )
    end
  end
end
