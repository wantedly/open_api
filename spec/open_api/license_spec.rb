RSpec.describe OpenApi::License do
  it "creates an instance" do
    expect(
      described_class.new(
        name: "Apache 2.0",
        url: "https://www.apache.org/licenses/LICENSE-2.0.html"
      )
    ).to be_a(described_class)
  end
end
