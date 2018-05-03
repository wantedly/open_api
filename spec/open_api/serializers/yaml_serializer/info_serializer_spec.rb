RSpec.describe OpenApi::Serializers::YamlSerializer::InfoSerializer do
  describe "#serialize" do
    subject { serializer.serialize(info) }

    let(:serializer) do
      contact_serializer = double(:contact_serializer)
      allow(contact_serializer).to receive(:serialize).and_return("dummy contact")
      license_serializer = double(:license_serializer)
      allow(license_serializer).to receive(:serialize).and_return("dummy license")

      described_class.new(
        contact_serializer: contact_serializer,
        license_serializer: license_serializer
      )
    end
    let(:info) do
      OpenApi::Info.new(
        title: "Awesome API",
        terms_of_service: "ToS",
        contact: contact,
        license: license,
        version: "1.0.0",
      )
    end
    let(:contact) { double(:contact) }
    let(:license) { double(:license) }

    it "serialize info object" do
      is_expected.to eq <<~YAML
      ---
      title: Awesome API
      termsOfService: ToS
      contact: dummy contact
      license: dummy license
      version: 1.0.0
      YAML
    end
  end

  describe "#deserialize" do
    subject { serializer.deserialize(string) }

    let(:serializer) do
      contact_serializer = double(:contact_serializer)
      allow(contact_serializer).to receive(:deserialize).and_return(contact)
      license_serializer = double(:license_serializer)
      allow(license_serializer).to receive(:deserialize).and_return(license)

      described_class.new(
        contact_serializer: contact_serializer,
        license_serializer: license_serializer
      )
    end
    let(:contact) { double(:contact) }
    let(:license) { double(:licese) }
    let(:string) do
      <<~YAML
      ---
      title: Awesome API
      termsOfService: ToS
      contact: dummy contact
      license: dummy license
      version: 1.0.0
      YAML
    end

    it "deserialize info object from YAML string" do
      is_expected.to eq(
        OpenApi::Info.new(
          title: "Awesome API",
          terms_of_service: "ToS",
          contact: contact,
          license: license,
          version: "1.0.0",
        )
      )
    end
  end
end
