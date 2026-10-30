RSpec.describe OpenApi::EquatableAsContent do
  describe "#==" do
    it "returns true for objects with the same content" do
      expect(OpenApi::Info.new(title: "Awesome API", version: "1.0.0")).to eq OpenApi::Info.new(title: "Awesome API", version: "1.0.0")
    end

    it "returns false for objects with different content" do
      expect(OpenApi::Info.new(title: "Awesome API", version: "1.0.0")).not_to eq OpenApi::Info.new(title: "Another API", version: "1.0.0")
      expect(OpenApi::Info.new(title: "Awesome API", version: "1.0.0")).not_to eq OpenApi::Info.new(title: "Awesome API", version: "2.0.0")
    end
  end
end
