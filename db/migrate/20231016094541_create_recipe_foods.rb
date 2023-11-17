# frozen_string_literal: true

class CreateRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_foods do |t|
      t.references :food, foreign_key: { to_table: :foods }
      t.references :recipe, foreign_key: { to_table: :recipes }
      t.float :quantity

      t.timestamps
    end
  end
end
