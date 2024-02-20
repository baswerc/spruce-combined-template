# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    regex = Regexp.new(Settings.web_origin_regex)
    origins { |source, _env| Settings.web_origin.split(',').include?(source) || source.match?(regex) }
    resource '*', headers: :any,
                  methods: :any,
                  credentials: true
  end
end

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins "example.com"
#
#     resource "*",
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
