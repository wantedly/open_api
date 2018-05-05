RSpec.describe OpenApi::Discriminator do
  it "creates an instance" do
    expect(
      described_class.new(
        property_name: "pet_type",
        mapping: {
          dog: '#/components/schemas/Dog',
          monster: 'https://gigantic-server.com/schemas/Monster/schema.json',
        },
      )
    ).to be_a(described_class)
  end
end
