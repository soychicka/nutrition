class CreateNutritionFoodGroups < ActiveRecord::Migration
  def change
    create_table :nutrition_food_groups do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
