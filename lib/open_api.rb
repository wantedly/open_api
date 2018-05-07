# Dependant libraries
require "active_support"
require "active_support/core_ext/hash"
require "active_support/core_ext/string/inflections"
require "active_support/core_ext/object/inclusion"

# open_api/*
require "open_api/equatable_as_content"
require "open_api/version"

# Models
require "open_api/specification"
require "open_api/info"
require "open_api/contact"
require "open_api/license"
require "open_api/server"
require "open_api/server_variable"
require "open_api/components"
require "open_api/paths"
require "open_api/path_item"
require "open_api/operation"
require "open_api/external_documentation"
require "open_api/parameter"
require "open_api/request_body"
require "open_api/media_type"
require "open_api/encoding"
require "open_api/responses"
require "open_api/response"
require "open_api/callback"
require "open_api/example"
require "open_api/link"
require "open_api/header"
require "open_api/tag"
require "open_api/reference"
require "open_api/schema"
require "open_api/discriminator"
require "open_api/xml"
require "open_api/security_schema"
require "open_api/o_auth_flows"
require "open_api/o_auth_flow"
require "open_api/security_requirement"

# Serializer
require "open_api/serializers"

module OpenApi
end
