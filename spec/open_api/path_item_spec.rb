RSpec.describe OpenApi::PathItem do
  let(:get_operation) { double(:operation) }
  let(:post_operation) { double(:operation) }
  let(:patch_operation) { double(:operation) }
  let(:delete_operation) { double(:operation) }

  it "creates an instance" do
    expect(
      described_class.new(
        get: get_operation,
        post: post_operation,
        patch: patch_operation,
        delete: delete_operation,
      )
    ).to be_a(described_class)
  end
end
