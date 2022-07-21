# frozen_string_literal: true

class Project < ApplicationRecord
  include FriendlyIdConcern
  friendly_id :name, use: %i[sequentially_slugged finders]

  # Validate the name of project must exists and unique.
  validates :name, presence: true, uniqueness: { scope: :user_id }

  # relations
  belongs_to :user
end
