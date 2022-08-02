# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Task, type: :model do
  context 'validations' do
    # rubocop:enable Metrics/BlockLength
    it { should validate_presence_of(:name) }

    context 'either start_date or end_date not in valid format' do
      it 'should return invalid date time format' do
        task = build(:task, end_date: 'invalid_date_format')
        task.validate
        expect(task.errors.size).not_to be_zero
        expect(task.errors.messages.fetch(:end_date)).to contain_exactly('not valid format, please use ISO format')
      end

      it 'should return invalid date time format' do
        task = build(:task, start_date: 'invalid_date_format', end_date: 'invalid_date_format')
        task.validate
        expect(task.errors.size).not_to be_zero
        expect(task.errors.messages.fetch(:end_date)).to contain_exactly('not valid format, please use ISO format')
      end
    end

    context 'start date provided' do
      context 'without end date' do
        it 'should return an error' do
          task = build(:task, start_date: Time.now)
          task.validate
          expect(task.errors.size).not_to be_zero
          expect(task.errors.messages.fetch(:end_date)).to contain_exactly('must present when start date provided')
        end
      end

      context 'with end date greater than start date' do
        it 'should NOT return an error' do
          now = Time.now
          task = build(:task, start_date: now, end_date: now + 1.hour)
          task.validate
          expect(task.errors.size).to be_zero
        end
      end

      context 'with end less than start date' do
        it 'should return an error' do
          now = Time.now
          task = build(:task, start_date: now, end_date: now - 1.second)
          task.validate
          expect(task.errors.size).not_to be_zero
          expect(task.errors.messages.fetch(:end_date)).to contain_exactly('should greater than start_date')
        end
      end
    end
  end

  context 'associations' do
    it { should belong_to(:user).required }
    it { should belong_to(:project).required }
  end
end
