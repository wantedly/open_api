RSpec.describe OpenApi::Reference do
  it "creates an instance" do
    expect(described_class.new(ref: "#/components/schemas/Book")).to be_a(described_class)
    expect(described_class.new(ref: "Book.json")).to be_a(described_class)
  end
end
