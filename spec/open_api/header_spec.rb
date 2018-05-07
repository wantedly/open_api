RSpec.describe OpenApi::Header do
  it "creates an instance" do
    expect(
      described_class.new(
        description: "The number of allowed requests in the current period",
        schema: double(:schema),
      )
    ).to be_a(described_class)
  end

  describe '#{field_name}' do
    subject { header.schema }

    let(:header) do
      described_class.new(
        description: "The number of allowed requests in the current period",
        schema: schema,
      )
    end
    let(:schema) { double(:schema) }

    it "returns value of field" do
      is_expected.to eq schema
    end
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "description" => "desc",
        "required" => true,
        "deprecated" => false,
        "allowEmptyValue" => false,
      }
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        description: "desc",
        required: true,
        deprecated: false,
        allow_empty_value: false,
      )
    end
  end
end
