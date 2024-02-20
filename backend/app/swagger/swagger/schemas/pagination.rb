# frozen_string_literal: true

# Pagination schema.
module Swagger
  module Schemas
    class Pagination
      include Swagger::Blocks

      swagger_schema :Pagination do
        key :required, %i[current_page per_page total_pages total_entries]

        property :current_page, type: :integer, description: 'The current page being returned.'
        property :per_page, type: :integer, description: 'The maximum number of entries returned per page.'
        property :total_pages, type: :integer, description: 'The total number of pages.'
        property :total_entries, type: :integer, description: 'The total number of entries.'
      end
    end
  end
end
