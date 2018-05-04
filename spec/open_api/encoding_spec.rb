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
end
