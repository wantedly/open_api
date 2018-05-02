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
end
