RSpec.describe OpenApi::Responses do
  let(:response_ok) { double(:response) }
  let(:response_created) { double(:response) }

  it "creates an instance" do
    expect(
      described_class.new(
        "200": response_ok,
        "201": response_created,
      )
    ).to be_a(described_class)
  end

  describe "#[]" do
    subject { responses["200"] }

    let(:responses) do
      described_class.new(
        "200": response,
      )
    end
    let(:response) { double(:response) }

    it "returns paired response" do
      is_expected.to eq response
    end
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "200" => response_hash,
      }
    end
    let(:response_hash) { double(:hash) }
    let(:response) { double(:response) }

    before do
      allow(OpenApi::Response).to receive(:load).with(response_hash).and_return(response)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        "200": response,
      )
    end
  end
end
