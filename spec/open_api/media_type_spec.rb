RSpec.describe OpenApi::MediaType do
  let(:schema) { double(:schema) }

  it "creates an instance" do
    expect(
      described_class.new(
        schema: schema,
      )
    ).to be_a(described_class)
  end
end
