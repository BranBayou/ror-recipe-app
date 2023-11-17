# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.string :name
      t.integer :preparation_time
      t.float :cooking_time
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
