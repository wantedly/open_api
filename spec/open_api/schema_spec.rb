RSpec.describe OpenApi::Schema do
  let(:author_ref) { double(:ref) }

  it "creates an instance" do
    expect(
      described_class.new(
        type: :string,
        format: :email,
      )
    ).to be_a(described_class)

    expect(
      described_class.new(
        nullable: true,
        type: :object,
        properties: {
          title: {
            type: :string,
          },
          author: {
            ref: author_ref,
          },
        }
      )
    ).to be_a(described_class)
  end

  describe '#{field_name}' do
    let(:schema) do
      described_class.new(
        nullable: true,
        type: :object,
        properties: {
          title: {
            type: :string,
          },
        }
      )
    end

    it "returns object from other_fields_hash" do
      expect(schema.type).to eq :object
      expect(schema.properties).to eq(
        {
          title: {
            type: :string,
          },
        }
      )
    end
  end
end
