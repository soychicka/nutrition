class CreateNutritionNutrients < ActiveRecord::Migration
  def change
    create_table :nutrition_nutrients do |t|
      t.string :unit
      t.string :label
      t.text :name
      t.integer :significant_figures
      t.integer :position

      t.timestamps null: false
    end
  end
end
