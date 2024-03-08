# frozen_string_literal: true

class WelcomeController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: { message: "Welcome to the Team Snowbird's Spruce coding challenge #{current_user.ssn}!" }
  end
end
