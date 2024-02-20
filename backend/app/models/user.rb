# frozen_string_literal: true

class User < Dry::Struct
  attribute :uuid, Types::String
  attribute :identity, UserIdentity

  delegate :email, to: :identity, allow_nil: true

  def user_account
    @user_account ||= UserAccount.find(uuid)
  end
end
