RSpec.describe OpenApi::RequestBody do
  let(:json_object) { double(:media_type) }
  let(:xml_object) { double(:media_type) }
  let(:text_object) { double(:media_type) }
  let(:all_object) { double(:media_type) }

  it "creates an instance" do
    expect(
      described_class.new(
        description: "user to add to the system",
        content: {
          "application/json" => json_object,
          "application/xml" => xml_object,
          "text/plain" => text_object,
          "*/*" => all_object,
        },
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "description" => "desc",
        "content" => {
          "application/json" => json_object_hash,
        }
      }
    end
    let(:json_object_hash) { double(:media_type_hash) }
    let(:json_object) { double(:media_type) }

    before do
      allow(OpenApi::MediaType).to receive(:load).with(json_object_hash).and_return(json_object)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        description: "desc",
        content: {
          "application/json" => json_object,
        },
      )
    end
  end
end
