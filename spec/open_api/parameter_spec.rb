RSpec.describe OpenApi::Parameter do
  let(:schema) { double(:schema) }

  it "creates an instance" do
    expect(
      described_class.new(
        name: "username",
        in: "path",
        required: true,
        schema: schema,
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
end
