# frozen_string_literal: true

module V1
  class ApidocsController < ApplicationController
    include Swagger::Blocks

    swagger_root do
      key :swagger, '2.0'
      info do
        key :version, '1.0.0'
        key :title, 'Spruce Coding Challenge API'
        key :description, 'The API for implementing the Spruce coding challenge.'
        key :termsOfService, ''
        contact do
          key :name, 'Team Snowbird.'
        end
        license do
          key :name, 'Creative Commons Zero v1.0 Universal'
        end
      end

      tag do
        key :name, 'group_1'
        key :description, 'Group One'
      end

      key :host, Settings.hostname
      key :schemes, %w[https http]
      key :basePath, '/'
      key :consumes, ['application/json']
      key :produces, ['application/json']

      parameter 'authorization' do
        key :name, 'Authorization'
        key :in, :header
        key :description, 'The authorization method and token value'
        key :required, true
        key :type, :string
      end
    end

    # A list of all classes that have swagger_* declarations.
    SWAGGERED_CLASSES = [
      Swagger::Schemas::Errors,
      Swagger::Schemas::Pagination,
      self
    ].freeze

    def index
      render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
    end
  end
end
