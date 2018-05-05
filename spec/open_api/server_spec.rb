RSpec.describe OpenApi::Server do
  it "creates an instance" do
    expect(
      described_class.new(
        "url": "https://example.com/v1",
        "description": "Development server"
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "url" => "https://example.com",
        "description" => "Desc",
        "variables" => [variable_hash],
      }
    end
    let(:variable_hash) { double(:variable_hash) }
    let(:variable) { double(:variable) }

    before do
      allow(OpenApi::ServerVariable).to receive(:load).with(variable_hash).and_return(variable)
    end

    it "creates an instance" do
      is_expected.to eq described_class.new(
        url: "https://example.com",
        description: "Desc",
        variables: [variable],
      )
    end
  end
end
