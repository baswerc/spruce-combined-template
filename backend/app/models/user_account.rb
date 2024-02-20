# frozen_string_literal: true

class UserAccount < ApplicationRecord
  validates :icn, uniqueness: true, allow_nil: true

  def verified?
    icn.present?
  end
end
