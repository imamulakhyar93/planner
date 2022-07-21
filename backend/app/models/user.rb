# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 6 }, allow_nil: true
  validates_uniqueness_of :email
end
