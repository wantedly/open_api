RSpec.describe OpenApi::Parameter do
  it "creates an instance" do
    expect(
      described_class.new(
        name: "username",
        in: "path",
        required: true,
        schema: double(:schema),
      )
    ).to be_a(described_class)
  end

  describe '#{field_name}' do
    subject { parameter.schema }

    let(:field_name) { "schema" }
    let(:parameter) do
      described_class.new(
        name: "username",
        in: :path,
        required: true,
        schema: schema
      )
    end
    let(:schema) { double(:schema) }

    it "returns an object for the field" do
      is_expected.to eq schema
    end
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "name" => "username",
        "in" => "path",
        "required" => true,
        "schema" => schema_hash,
      }
    end
    let(:schema_hash) { double(:schema_hash) }
    let(:schema) { double(:schema) }

    before do
      allow(OpenApi::Schema).to receive(:load).with(schema_hash).and_return(schema)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        name: "username",
        in: "path",
        required: true,
        schema: schema,
      )
    end
  end
end
