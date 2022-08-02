# frozen_string_literal: true

class Task < ApplicationRecord
  include FriendlyIdConcern
  friendly_id :name, use: %i[sequentially_slugged finders]

  # validations
  validates_presence_of :name
  validates :start_date, date_time: true
  validates :end_date, date_time: { greater_than: :start_date }
  validate :completion_date

  # associations
  belongs_to :project
  belongs_to :user

  def completion_date
    errors.add(:end_date, 'must present when start date provided') if start_date.present? && end_date.nil?
  end
end
