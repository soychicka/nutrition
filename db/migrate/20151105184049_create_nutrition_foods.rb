class CreateNutritionFoods < ActiveRecord::Migration
  def change
    create_table :nutrition_foods do |t|
      t.references :food_group, index: true, foreign_key: true
      t.text :description
      t.string :summary
      t.text :aliases
      t.string :manufacturer
      t.boolean :is_complete
      t.string :waste_description
      t.integer :waste_yield
      t.string :origin
      t.decimal :nitrogen_protein_yield
      t.decimal :protein_calorie_yield
      t.decimal :fat_calorie_yield
      t.decimal :carb_calorie_yield

      t.timestamps null: false
    end
  end
end
