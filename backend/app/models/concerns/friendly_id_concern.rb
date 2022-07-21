# frozen_string_literal: true

module FriendlyIdConcern
  extend ActiveSupport::Concern

  included do
    include FriendlyId
    # Slug will be auto generated from FriendlyId gem
    # Validate slug to be exists and unique, The regex below only accept a-z letters, - and numbers
    validates :slug, presence: true, uniqueness: { scope: :user_id }, format: { with: /\A[a-z0-9-]+\z/ }
  end
end
