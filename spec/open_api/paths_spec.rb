RSpec.describe OpenApi::Paths do
  let(:path) { double(:path) }

  it "creates instance" do
    expect(described_class.new).to be_a(described_class)
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

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "/books" => double(:path_item_hash),
      }
    end
    let(:path_item) { double(:path_item) }

    before do
      allow(OpenApi::PathItem).to receive(:load).and_return(path_item)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        "/books": path_item
      )
    end
  end
end
