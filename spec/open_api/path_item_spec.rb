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

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "$ref" => "#/foo",
        "summary" => "short desc",
        "description" => "long desc",
        "servers" => [server_hash],
        "parameters" => [parameter_hash],
        "get" => get_operation_hash,
        "post" => post_operation_hash,
      }
    end
    # Hashes
    let(:server_hash) { double(:server_hash) }
    let(:parameter_hash) { double(:parameter_hash) }
    let(:get_operation_hash) { double(:operation_hash) }
    let(:post_operation_hash) { double(:operation_hash) }
    # Objects
    let(:server) { double(:server) }
    let(:parameter) { double(:parameter) }
    let(:get_operation) { double(:operation) }
    let(:post_operation) { double(:operation) }

    before do
      # Thease hashes don't have "$ref".
      allow(server_hash).to receive(:[]).with("$ref").and_return(nil)
      allow(parameter_hash).to receive(:[]).with("$ref").and_return(nil)
      allow(get_operation_hash).to receive(:[]).with("$ref").and_return(nil)
      allow(post_operation_hash).to receive(:[]).with("$ref").and_return(nil)

      allow(OpenApi::Server).to receive(:load).and_return(server)
      allow(OpenApi::Parameter).to receive(:load).and_return(parameter)
      allow(OpenApi::Operation).to receive(:load).with(get_operation_hash).and_return(get_operation)
      allow(OpenApi::Operation).to receive(:load).with(post_operation_hash).and_return(post_operation)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        ref: "#/foo",
        summary: "short desc",
        description: "long desc",
        servers:  [server],
        parameters: [parameter],
        get: get_operation,
        post: post_operation,
      )
    end
  end
end
