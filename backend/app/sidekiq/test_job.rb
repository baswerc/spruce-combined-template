# frozen_string_literal: true

class TestJob
  include Sidekiq::Job

  def perform(*args)
    Rails.logger.info("TestJob started #{args}")
    Rails.logger.info('TestJob ended')
  end
end
