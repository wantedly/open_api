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

    context "when not initialized field" do
      let(:schema) do
        described_class.new(
          nullable: true,
          type: :object,
        )
      end

      it "returns nil" do
        expect(schema.properties).to be_nil
      end
    end

    context "when initialized after initialzing object self" do
      let(:schema) do
        described_class.new(
          nullable: true,
          type: :object,
        )
      end

      before do
        schema.properties = {
          title: {
            type: :string,
          }
        }
      end

      it "returns assigned value for field" do
        expect(schema.properties).to eq(
          {
            title: {
              type: :string,
            },
          }.with_indifferent_access
        )
      end
    end
  end

  describe '#{field_name}=' do
    let(:schema) { described_class.new }

    it "assigns value" do
      expect { schema.type = :object }.to change { schema.type }.from(nil).to(:object)
    end

    it "defines attribute assessors" do
      expect { schema.type = :object }
        .to change { schema.respond_to?(:type) }.to(true)
        .and change { schema.respond_to?(:type=) }.to(true)
    end
  end

  describe ".load" do
    subject { described_class.load(hash) }

    let(:hash) do
      {
        "nullable" => false,
        "type" => "object",
        "xml" => xml_hash,
        "externalDocs" => external_docs_hash,
        "example" => example_hash,
      }
    end
    # Hashes
    let(:xml_hash) { double(:xml_hash) }
    let(:external_docs_hash) { double(:external_docs_hash) }
    let(:example_hash) { double(:example_hash) }
    # Objects
    let(:xml) { double(:xml) }
    let(:external_docs) { double(:external_docs) }
    let(:example) { double(:example) }

    before do
      allow(OpenApi::Xml).to receive(:load).with(xml_hash).and_return(xml)
      allow(OpenApi::ExternalDocumentation).to receive(:load).with(external_docs_hash).and_return(external_docs)
      allow(OpenApi::Example).to receive(:load).with(example_hash).and_return(example)
    end

    it "creates an instance from hash" do
      is_expected.to eq described_class.new(
        nullable: false,
        type: "object",
        xml: xml,
        external_docs: external_docs,
        example: example,
      )
    end
  end
end
