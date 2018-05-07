RSpec.describe OpenApi::MediaType do
  let(:schema) { double(:schema) }

  it "creates an instance" do
    expect(
      described_class.new(
        schema: schema,
      )
    ).to be_a(described_class)
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "schema" => schema_hash,
        "examples" => {
          "cat" => example_hash,
        },
        "encoding" => {
          "historyMetadata" => encoding_hash,
        },
      }
    end
    # Hashes
    let(:schema_hash) { double(:hash) }
    let(:example_hash) { double(:hash) }
    let(:encoding_hash) { double(:hash) }
    # Objects
    let(:schema) { double(:schema) }
    let(:example) { double(:example) }
    let(:encoding) { double(:encoding) }

    before do
      allow(schema_hash).to receive(:[]).with("$ref").and_return(nil)
      allow(example_hash).to receive(:[]).with("$ref").and_return(nil)

      allow(OpenApi::Schema).to receive(:load).with(schema_hash).and_return(schema)
      allow(OpenApi::Example).to receive(:load).with(example_hash).and_return(example)
      allow(OpenApi::Encoding).to receive(:load).with(encoding_hash).and_return(encoding)
    end

    it "ceates an instance from hash" do
      is_expected.to eq described_class.new(
        schema: schema,
        examples: {
          "cat" => example,
        },
        encoding: {
          "historyMetadata" => encoding,
        }
      )
    end
  end
end
