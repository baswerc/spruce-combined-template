# frozen_string_literal: true

require 'json'
class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  before_action :add_response_headers

  def add_response_headers
    response.headers['X-Git-SHA'] = AppInfo::GIT_REVISION
    response.headers['X-GitHub-Repository'] = AppInfo::GITHUB_URL
  end
end
