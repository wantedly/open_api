RSpec.describe OpenApi::Specification do
  let(:openapi) { "3.0.1" }
  let(:info) { double(:info) }
  let(:paths) { double(:paths) }

  it "creates instance" do
    expect(
      described_class.new(
        openapi: openapi,
        info: info,
        paths: paths,
      )
    ).to be_a(described_class)
  end
end
