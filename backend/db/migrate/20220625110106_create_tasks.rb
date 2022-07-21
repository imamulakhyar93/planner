# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.timestamp :start_date
      t.timestamp :end_date
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
