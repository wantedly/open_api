RSpec.describe OpenApi::Paths do
  let(:path) { double(:path) }

  it "creates instance" do
    expect(described_class.new("/books": path)).to be_a(described_class)
    expect(described_class.new({"/books": path})).to be_a(described_class)
  end

  describe "#[]" do
    subject { paths["/books"] }

    let(:paths) { described_class.new({ "/books": path }) }
    let(:path) { double(:path) }

    it "returns paired path" do
      is_expected.to eq path
    end
  end
end
