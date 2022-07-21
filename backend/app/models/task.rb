# frozen_string_literal: true

class Task < ApplicationRecord
  include FriendlyIdConcern
  friendly_id :name, use: %i[sequentially_slugged finders]

  # Validate the name of project must exists
  validates :name, presence: true

  # relations
  belongs_to :project
  belongs_to :user
end
