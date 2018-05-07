RSpec.describe OpenApi::Serializers::YamlSerializer do
  describe "#serialize" do
    subject { described_class.new.serialize(specification) }

    let(:specification) do
      OpenApi::Specification.new(
        openapi: "3.0.1",
        info: OpenApi::Info.new(
          title: "Awesome API",
          description: "It provides something awesome",
          version: "1.0.0",
        ),
        paths: OpenApi::Paths.new(
          "/pets": OpenApi::PathItem.new(
            get: OpenApi::Operation.new(
              description: "Returns all pets from the system that the user has access to",
              responses: OpenApi::Responses.new(
                "200": OpenApi::Response.new(
                  description: "A list of pets.",
                  content: {
                    "application/json": OpenApi::MediaType.new(
                      schema: OpenApi::Schema.new(
                        type: "array",
                        items: OpenApi::Reference.new(ref: "#/components/schemas/pet"),
                      )
                    )
                  }
                )
              )
            )
          )
        )
      )
    end

    it "creates yaml string from specification object" do
      is_expected.to eq(
<<-EOL
---
openapi: 3.0.1
info:
  title: Awesome API
  description: It provides something awesome
  version: 1.0.0
paths:
  "/pets":
    get:
      description: Returns all pets from the system that the user has access to
      responses:
        '200':
          description: A list of pets.
          content:
            application/json:
              schema:
                type: array
                items:
                  "$ref": "#/components/schemas/pet"
EOL
      )
    end
  end

  describe "#deserialize" do
    subject { described_class.new.deserialize(yaml_string) }

    let(:yaml_string) do
<<-EOL
---
openapi: "3.0.1"
info:
  title: "Awesome API"
  description: "It provides something awesome"
  version: "1.0.0"
paths:
  /pets:
    get:
      description: "Returns all pets from the system that the user has access to"
      responses:
        200:
          description: "A list of pets."
          content:
            application/json:
              schema:
                type: array
                items:
                  $ref: "#/components/schemas/pet"
EOL
    end

    it "creates an specification object from yaml string" do
      is_expected.to eq OpenApi::Specification.new(
        openapi: "3.0.1",
        info: OpenApi::Info.new(
          title: "Awesome API",
          description: "It provides something awesome",
          version: "1.0.0",
        ),
        paths: OpenApi::Paths.new(
          "/pets": OpenApi::PathItem.new(
            get: OpenApi::Operation.new(
              description: "Returns all pets from the system that the user has access to",
              responses: OpenApi::Responses.new(
                "200": OpenApi::Response.new(
                  description: "A list of pets.",
                  content: {
                    "application/json": OpenApi::MediaType.new(
                      schema: OpenApi::Schema.new(
                        type: "array",
                        items: OpenApi::Reference.new(ref: "#/components/schemas/pet"),
                      )
                    )
                  }
                )
              )
            )
          )
        )
      )
    end
  end

end
