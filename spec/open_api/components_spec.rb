RSpec.describe OpenApi::Components do
  let(:schemas) { Hash.new }
  let(:responses) { Hash.new }
  let(:parameters) { Hash.new }
  let(:examples) { Hash.new }
  let(:request_bodies) { Hash.new }
  let(:headers) { Hash.new }
  let(:security_schemes) { Hash.new }
  let(:links) { Hash.new }
  let(:callbacks) { Hash.new }

  it "creates an instance" do
    expect(
      described_class.new(
        schemas: schemas,
        responses: responses,
        parameters: parameters,
        examples: examples,
        request_bodies: request_bodies,
        headers: headers,
        security_schemes: security_schemes,
        links: links,
        callbacks: callbacks,
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "schemas" => {
          "Pet" => schema_hash,
        },
        "responses" => {
          "get_pet" => response_hash,
        },
        "parameters" => {
          "pet_parameter" => parameter_hash,
        },
        "requestBodies" => {
          "pet_body" => request_body_hash,
        },
        "headers" => {
          "page" => header_hash,
        },
        "securitySchemes" => {
          "basic" => security_scheme_hash,
        },
        "links" => {
          "next_page" => link_hash,
        },
        "callbacks" => {
          "success" => callback_hash,
        }
      }
    end
    # Hashes
    let(:schema_hash) { double(:hash) }
    let(:response_hash) { double(:hash) }
    let(:parameter_hash) { double(:hash) }
    let(:request_body_hash) { double(:hash) }
    let(:header_hash) { double(:hash) }
    let(:security_scheme_hash) { double(:hash) }
    let(:link_hash) { double(:hash) }
    let(:callback_hash) { double(:hash) }
    # Objects
    let(:schema) { double(:schema) }
    let(:response) { double(:response) }
    let(:parameter) { double(:parameter) }
    let(:request_body) { double(:request_body) }
    let(:header) { double(:header) }
    let(:security_scheme) { double(:security_scheme) }
    let(:link) { double(:link) }
    let(:callback) { double(:callback) }

    before do
      [
        schema_hash,
        response_hash,
        parameter_hash,
        request_body_hash,
        header_hash,
        security_scheme_hash,
        link_hash,
        callback_hash,
      ].each do |hash|
        allow(hash).to receive(:[]).with("$ref").and_return(nil)
      end

      allow(OpenApi::Schema).to receive(:load).with(schema_hash).and_return(schema)
      allow(OpenApi::Response).to receive(:load).with(response_hash).and_return(response)
      allow(OpenApi::Parameter).to receive(:load).with(parameter_hash).and_return(parameter)
      allow(OpenApi::RequestBody).to receive(:load).with(request_body_hash).and_return(request_body)
      allow(OpenApi::Header).to receive(:load).with(header_hash).and_return(header)
      allow(OpenApi::SecuritySchema).to receive(:load).with(security_scheme_hash).and_return(security_scheme)
      allow(OpenApi::Link).to receive(:load).with(link_hash).and_return(link)
      allow(OpenApi::Callback).to receive(:load).with(callback_hash).and_return(callback)
    end

    it "creates an instance from a hash" do
      is_expected.to eq described_class.new(
        schemas: {
          "Pet" => schema,
        },
        responses: {
          "get_pet" => response,
        },
        parameters: {
          "pet_parameter" => parameter,
        },
        request_bodies: {
          "pet_body" => request_body,
        },
        headers: {
          "page" => header,
        },
        security_schemes: {
          "basic" => security_scheme,
        },
        links: {
          "next_page" => link,
        },
        callbacks: {
          "success" => callback,
        }
      )
    end
  end
end
