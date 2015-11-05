class CreateNutritionMasses < ActiveRecord::Migration
  def change
    create_table :nutrition_masses do |t|
      t.references :food, index: true, foreign_key: true
      t.integer :seq
      t.decimal :quantity
      t.string :unit
      t.decimal :mass
      t.integer :datapoints
      t.decimal :standard_deviation

      t.timestamps null: false
    end
  end
end
