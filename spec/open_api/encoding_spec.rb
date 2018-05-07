RSpec.describe OpenApi::Encoding do
  it "creates an instance" do
    expect(
      described_class.new(
        content_type: "application/xml; charset=utf-8"
      )
    ).to be_a(described_class)

    expect(
      described_class.new(
        content_type: "image/png, image/jpeg",
        headers: {
          "X-Rate-Limit-Limit" => double(:header),
        },
      )
    ).to be_a(described_class)
  end

  describe ".laod" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "contentType" => "text/plain",
        "headers" => {
          "X-Rate-Limit-Limit" => header_hash,
        },
      }
    end
    let(:header_hash) { double(:hash) }
    let(:header) { double(:header) }

    before do
      allow(header_hash).to receive(:[]).with("$ref").and_return(nil)
      allow(OpenApi::Header).to receive(:load).with(header_hash).and_return(header)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        content_type: "text/plain",
        headers: {
          "X-Rate-Limit-Limit" => header,
        }
      )
    end
  end
end
