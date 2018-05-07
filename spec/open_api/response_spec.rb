RSpec.describe OpenApi::Response do
  let(:content) do
    {
      "application/json" => media_type,
    }
  end
  let(:media_type) { double(:media_type) }

  it "creates an instance" do
    expect(
      described_class.new(
        description: "A book object",
        content: content,
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "description" => "desc",
        "headers" => {
          "page" => header_hash,
        },
        "content" => {
          "pet" => media_type_hash,
        },
        "links" => {
          "next" => link_hash,
        },
      }
    end
    # Hashes
    let(:header_hash) { double(:hash) }
    let(:media_type_hash) { double(:hash) }
    let(:link_hash) { double(:hash) }
    # Objects
    let(:header) { double(:header) }
    let(:media_type) { double(:media_type) }
    let(:link) { double(:link) }

    before do
      allow(link_hash).to receive(:[]).with("$ref").and_return(nil)

      allow(OpenApi::Header).to receive(:load).with(header_hash).and_return(header)
      allow(OpenApi::MediaType).to receive(:load).with(media_type_hash).and_return(media_type)
      allow(OpenApi::Link).to receive(:load).with(link_hash).and_return(link)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        description: "desc",
        headers: {
          page: header,
        },
        content: {
          pet: media_type,
        },
        links: {
          next: link,
        }
      )
    end
  end
end
