# frozen_string_literal: true

class UserIdentity < Dry::Struct
  attribute :uuid, Types::String
  attribute :email, Types::String
  attribute :first_name, Types::String
  attribute :middle_name, Types::String.optional
  attribute :last_name, Types::String
  attribute :gender, Types::String.optional
  attribute :birth_date, Types::String.optional
  attribute :icn, Types::String
  attribute :ssn, Types::String.optional
end
