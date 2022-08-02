# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_presence_of :email }
    it { should validate_length_of(:password).is_at_least(6) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  context 'associations' do
    it { should have_many(:projects).dependent(:destroy) }
    it { should have_many(:tasks).dependent(:destroy) }
  end
end
