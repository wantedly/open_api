RSpec.describe OpenApi::Operation do
  let(:responses) { double(:responses) }

  it "creates an instance" do
    expect(
      described_class.new(
        responses: responses,
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "responses" => responses_hash,
        "tags" => ["tag"],
        "summary" => "Short desc",
        "description" => "Long desc",
        "externalDocs" => external_docs_hash,
        "operationId" => "op id",
        "parameters" => [parameter_hash],
        "requestBody" => request_body_hash,
        "callbacks" => {
          "Acallback" => callback_hash,
        },
        "deprecated" => false,
        "security" => [security_requirement_hash],
        "servers" => [server_hash],
      }
    end
    # Hashes
    let(:responses_hash) { double(:hash) }
    let(:external_docs_hash) { double(:hash) }
    let(:parameter_hash) { double(:hash) }
    let(:request_body_hash) { double(:hash) }
    let(:callback_hash) { double(:hash) }
    let(:security_requirement_hash) { double(:hash) }
    let(:server_hash) { double(:hash) }
    # Objects
    let(:responses) { double(:response) }
    let(:external_docs) { double(:external_documentaion) }
    let(:parameter) { double(:parameter) }
    let(:request_body) { double(:request_body) }
    let(:callback) { double(:callback) }
    let(:security_requirement) { double(:security_requirement) }
    let(:server) { double(:server) }

    before do
      allow(parameter_hash).to receive(:[]).with("$ref").and_return(nil)
      allow(request_body_hash).to receive(:[]).with("$ref").and_return(nil)
      allow(callback_hash).to receive(:[]).with("$ref").and_return(nil)

      allow(OpenApi::Responses).to receive(:load).with(responses_hash).and_return(responses)
      allow(OpenApi::ExternalDocumentation).to receive(:load).with(external_docs_hash).and_return(external_docs)
      allow(OpenApi::Parameter).to receive(:load).with(parameter_hash).and_return(parameter)
      allow(OpenApi::RequestBody).to receive(:load).with(request_body_hash).and_return(request_body)
      allow(OpenApi::Callback).to receive(:load).with(callback_hash).and_return(callback)
      allow(OpenApi::SecurityRequirement).to receive(:load).with(security_requirement_hash).and_return(security_requirement)
      allow(OpenApi::Server).to receive(:load).with(server_hash).and_return(server)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        responses: responses,
        tags: ["tag"],
        summary: "Short desc",
        description: "Long desc",
        external_docs: external_docs,
        operation_id: "op id",
        parameters: [parameter],
        request_body: request_body,
        callbacks: {
          "Acallback" => callback,
        },
        deprecated: false,
        security: [security_requirement],
        servers: [server],
      )
    end
  end
end
