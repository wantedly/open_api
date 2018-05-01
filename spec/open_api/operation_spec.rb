RSpec.describe OpenApi::Operation do
  let(:responses) { double(:responses) }

  it "creates an instance" do
    expect(
      described_class.new(
        responses: responses,
      )
    ).to be_a(described_class)
  end
end
