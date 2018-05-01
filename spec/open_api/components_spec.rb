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
end
