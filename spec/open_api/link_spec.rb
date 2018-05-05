RSpec.describe OpenApi::Link do
  it "creates an instance" do
    expect(
      described_class.new(
        operation_id: "getUserAddress",
        responses: { "200" => double(:response) }
      )
    ).to be_a(described_class)
  end

  describe '#{field_name}' do
    subject { link.responses }

    let(:link) { described_class.new(responses: responses) }
    let(:responses) { double(:responses) }

    it "returns value of field" do
      is_expected.to eq responses
    end
  end

  describe '#{field_name}=' do
    subject { link.responses = new_responses }

    let(:link) { described_class.new(responses: responses) }
    let(:responses) { double(:responses) }
    let(:new_responses) { double(:responses) }

    it "assigns new value" do
      expect { subject }.to change { link.responses }.from(responses).to(new_responses)
    end
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "operationRef" => "opref",
        "operationId" => "opid",
        "parameters" => parameters,
        "requestBody" => request_body_hash,
        "description" => "desc",
        "server" => server_hash,
      }
    end
    # Hashes
    let(:request_body_hash) { double(:hash) }
    let(:server_hash) { double(:hash) }
    # Objects
    let(:parameters) { double(:has) }
    let(:request_body) { double(:request_body) }
    let(:server) { double(:server) }

    before do
      allow(OpenApi::RequestBody).to receive(:load).with(request_body_hash).and_return(request_body)
      allow(OpenApi::Server).to receive(:load).with(server_hash).and_return(server)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        operation_id: "opid",
        operation_ref: "opref",
        parameters: parameters,
        request_body: request_body,
        description: "desc",
        server: server,
      )
    end
  end
end
