# frozen_string_literal: true

class WelcomeController < ApplicationController
  skip_before_action :authenticate, only: [:index]
  def index
    render json: { message: "Welcome to the Team Snowbird's Spruce coding challenge!" }
  end
end
