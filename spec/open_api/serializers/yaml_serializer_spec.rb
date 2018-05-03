RSpec.describe OpenApi::Serializers::YamlSerializer do
  describe "#serialize" do
    subject { described_class.new.serialize(spec) }

    let(:spec) do
      OpenApi::Specification.new(
        openapi: "3.0.1",
        info: OpenApi::Info.new(
          title: "Awesome API",
          version: "1.0.0",
        ),
        paths: OpenApi::Paths.new(
          "/books": OpenApi::PathItem.new(
            get: OpenApi::Operation.new(
              responses: OpenApi::Responses.new(
                "200": OpenApi::Response.new(
                  description: "array of book",
                  content: {
                    "application/json" => OpenApi::Reference.new(ref: "#/components/schemas/Book"),
                  },
                )
              )
            ),
            post: OpenApi::Operation.new(
              responses: OpenApi::Responses.new(
                "201": OpenApi::Response.new(
                  description: "created book",
                  content: {
                    "application/json" => OpenApi::Reference.new(ref: "#/components/schemas/Book")
                  },
                )
              )
            )
          )
        ),
      )
    end

    it "serializes spec" do
      is_expected.to eq <<~YAML
      ---
      openapi: 3.0.1
      info: TODO
      paths: TODO
      YAML
    end
  end
end
