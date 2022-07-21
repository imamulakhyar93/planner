# frozen_string_literal: true

class TaskSerializer < ActiveModel::Serializer
  attributes :name, :description, :slug, :status, :start_date, :end_date, :completed_at, :created_at
  # belongs_to :project
end
