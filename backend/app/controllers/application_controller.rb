# frozen_string_literal: true

require 'json'
class ApplicationController < ActionController::API
  attr_reader :current_user

  before_action :add_response_headers, :authenticate

  def authenticate
    identity = UserIdentity.new(JSON.parse(File.read('mock_data/user/richard_williams.json'), symbolize_names: true))
    @current_user = User.new(uuid: identity.uuid, identity:)
  end

  def add_response_headers
    response.headers['X-Git-SHA'] = AppInfo::GIT_REVISION
    response.headers['X-GitHub-Repository'] = AppInfo::GITHUB_URL
  end
end
