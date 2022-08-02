# frozen_string_literal: true

class Project < ApplicationRecord
  include FriendlyIdConcern
  friendly_id :name, use: %i[sequentially_slugged finders]

  # Validate the name of project must exists and unique.
  validates_presence_of :name, :user_id
  validates_uniqueness_of :name, scope: :user_id, case_sensitive: false
  # validates :name, presence: true, uniqueness: { scope: :user_id, case_sensitive: false }

  # relations
  belongs_to :user
  has_many :tasks
end
