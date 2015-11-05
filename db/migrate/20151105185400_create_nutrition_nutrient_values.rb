class CreateNutritionNutrientValues < ActiveRecord::Migration
  def change
    create_table :nutrition_nutrient_values do |t|
      t.references :food, index: true, foreign_key: true
      t.references :nutrient, index: true, foreign_key: true
      t.decimal :yield
      t.boolean :is_fortified
      t.integer :estimated_from
      t.timestamp :last_update

      t.timestamps null: false
    end
  end
end
