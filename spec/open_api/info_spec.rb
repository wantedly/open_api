RSpec.describe OpenApi::Info do
  let(:title) { "Awesome API" }
  let(:version) { "1.0.0" }

  it "creates instance" do
    expect(
      described_class.new(
        title: title,
        version: version,
      )
    ).to be_a(described_class)
  end
end
