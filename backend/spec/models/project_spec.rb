# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Project, type: :model do
  context 'validations' do
    subject { Project.new(name: 'MyProject', user: create(:user)) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:user_id).case_insensitive }
  end

  context 'associations' do
    it { should belong_to(:user).required }
    it { should have_many(:tasks) }
  end
end
