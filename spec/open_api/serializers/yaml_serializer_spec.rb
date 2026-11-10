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

    context "with a specification built in the same way as open_api_annotator" do
      let(:specification) do
        paths = OpenApi::Paths.new
        paths["/books"] = OpenApi::PathItem.new.tap do |path_item|
          path_item.operations["get"] = build_operation(
            "Returns an array of Book",
            OpenApi::Schema.new(type: "array", items: OpenApi::Reference.new(ref: "#/components/schemas/Book")),
          )
        end
        paths["/books/{id}"] = OpenApi::PathItem.new.tap do |path_item|
          path_item.operations["get"] = build_operation("Returns a Book", OpenApi::Reference.new(ref: "#/components/schemas/Book"), ["id"])
          path_item.operations["patch"] = build_operation("Returns a Book", OpenApi::Reference.new(ref: "#/components/schemas/Book"), ["id"])
        end
        paths["/books/count"] = OpenApi::PathItem.new.tap do |path_item|
          path_item.operations["get"] = build_operation("Returns a integer", OpenApi::Schema.new(type: :integer, format: :int32))
        end

        schema = OpenApi::Schema.new(type: "object", properties: {})
        schema.properties.merge!(
          id: OpenApi::Schema.new(type: :integer, format: nil, nullable: false),
          title: OpenApi::Schema.new(type: :string, format: nil, nullable: false),
          published_at: OpenApi::Schema.new(type: :string, format: :"date-time", nullable: true),
          tags: OpenApi::Schema.new(type: "array", items: OpenApi::Schema.new(type: :string, format: nil, nullable: false)),
          authors: OpenApi::Schema.new(type: "array", items: OpenApi::Reference.new(ref: "#/components/schemas/Author"), nullable: false),
          cover_image: OpenApi::Reference.new(ref: "#/components/schemas/CoverImage"),
          publisher: OpenApi::Schema.new(nullable: true, allOf: [OpenApi::Reference.new(ref: "#/components/schemas/Publisher")]),
        )
        schema.required = [:id, :title]
        components = OpenApi::Components.new(schemas: {})
        components.schemas["Book"] = schema

        OpenApi::Specification.new(
          openapi: "3.0.1",
          info: OpenApi::Info.new(title: "Book API", version: "1"),
          paths: paths,
          components: components,
        )
      end

      def build_operation(description, schema, path_parameter_names = [])
        operation = OpenApi::Operation.new(responses: OpenApi::Responses.new)
        operation.responses["200"] = OpenApi::Response.new(
          description: description,
          content: { "application/json" => OpenApi::MediaType.new(schema: schema) },
        )
        path_parameter_names.each do |name|
          operation.parameters = [] unless operation.parameters
          operation.parameters.push(
            OpenApi::Parameter.new(name: name, in: :path, required: true, schema: OpenApi::Schema.new(type: :string))
          )
        end
        operation
      end

      it "creates yaml string from specification object" do
        is_expected.to eq(
<<-EOL
---
openapi: 3.0.1
info:
  title: Book API
  version: '1'
paths:
  "/books":
    get:
      responses:
        '200':
          description: Returns an array of Book
          content:
            application/json:
              schema:
                type: array
                items:
                  "$ref": "#/components/schemas/Book"
  "/books/{id}":
    get:
      responses:
        '200':
          description: Returns a Book
          content:
            application/json:
              schema:
                "$ref": "#/components/schemas/Book"
      parameters:
      - name: id
        in: path
        required: true
        schema:
          type: string
    patch:
      responses:
        '200':
          description: Returns a Book
          content:
            application/json:
              schema:
                "$ref": "#/components/schemas/Book"
      parameters:
      - name: id
        in: path
        required: true
        schema:
          type: string
  "/books/count":
    get:
      responses:
        '200':
          description: Returns a integer
          content:
            application/json:
              schema:
                type: integer
                format: int32
components:
  schemas:
    Book:
      type: object
      properties:
        id:
          type: integer
        title:
          type: string
        published_at:
          nullable: true
          type: string
          format: date-time
        tags:
          type: array
          items:
            type: string
        authors:
          type: array
          items:
            "$ref": "#/components/schemas/Author"
        cover_image:
          "$ref": "#/components/schemas/CoverImage"
        publisher:
          nullable: true
          allOf:
          - "$ref": "#/components/schemas/Publisher"
      required:
      - id
      - title
EOL
        )
      end
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
