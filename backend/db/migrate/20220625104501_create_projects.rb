# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :icon
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :projects, %i[user_id name], unique: true
  end
end
