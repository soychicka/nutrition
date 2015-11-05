class CreateNutritionLangualFactors < ActiveRecord::Migration
  def change
    create_table :nutrition_langual_factors do |t|
      t.text :description

      t.timestamps null: false
    end
  end
end
