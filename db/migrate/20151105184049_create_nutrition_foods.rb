class CreateNutritionFoods < ActiveRecord::Migration
  def change
    create_table :nutrition_foods do |t|
      t.references :nutrition_food_group, index: true, foreign_key: true
      t.text :description
      t.string :summary
      t.text :aliases
      t.string :manufacturer
      t.boolean :is_complete
      t.string :waste_description
      t.integer :waste_yield
      t.string :origin
      t.decimal :nitrogen_protein_yield, :default => 0, :precision => 4, :scale => 2
      t.decimal :protein_calorie_yield, :default => 0, :precision => 4, :scale => 2
      t.decimal :fat_calorie_yield, :default => 0, :precision => 4, :scale => 2
      t.decimal :carb_calorie_yield, :default => 0, :precision => 4, :scale => 2

      t.timestamps null: false
    end
  end
end
