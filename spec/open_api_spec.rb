RSpec.describe OpenApi do
  it "has a version number" do
    expect(OpenApi::VERSION).not_to be nil
  end

  it "creates simple spec" do
    spec = OpenApi::Specification.new(
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
    expect(spec).to be_a(OpenApi::Specification)
    expect(spec.paths["/books"].operations[:get].responses["200"].description).to eq "array of book"
    expect(spec.paths["/books"].operations[:get].responses["200"].content["application/json"].ref).to eq "#/components/schemas/Book"
    expect(spec.paths["/books"].operations[:post].responses["201"].description).to eq "created book"
    expect(spec.paths["/books"].operations[:post].responses["201"].content["application/json"].ref).to eq "#/components/schemas/Book"
  end
end
