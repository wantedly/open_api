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
end
