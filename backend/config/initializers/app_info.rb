# frozen_string_literal: true

module AppInfo
  GIT_REVISION = ENV.fetch('GIT_REVISION', 'MISSING_GIT_REVISION')
  GITHUB_URL = "https://github.com/ironbow/spruce-telehealth-api"
end
