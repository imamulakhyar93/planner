# frozen_string_literal: true

class ProjectSerializer < ActiveModel::Serializer
  attributes :slug, :name, :description, :created_at
end
