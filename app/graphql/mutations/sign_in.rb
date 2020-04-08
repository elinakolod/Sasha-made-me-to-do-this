module Mutations
  class SignIn < GraphqlDevise::Mutations::Login
    field :user, Types::UserType, null: true

    def resolve(email:, password:)
      original_payload = super do |user|
        user.reload
      end

      original_payload.merge(user: original_payload[:authenticable])
    end
  end
end