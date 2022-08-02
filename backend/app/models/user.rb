# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  # validates
  validates :password, length: { minimum: 6 }
  validates_presence_of :password, :email
  validates_uniqueness_of :email, case_sensitive: false

  # assosciations
  has_many :projects, dependent: :destroy
  has_many :tasks, dependent: :destroy
end
