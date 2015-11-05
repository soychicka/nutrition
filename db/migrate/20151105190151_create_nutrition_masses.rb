class CreateNutritionMasses < ActiveRecord::Migration
  def change
    create_table :nutrition_masses do |t|
      t.references :nutrition_food, index: true, foreign_key: true
      t.integer :seq
      t.decimal :quantity, :default => 0, :precision => 5, :scale => 3
      t.string :unit
      t.decimal :mass, :default => 0, :precision => 7, :scale => 1
      t.integer :datapoints
      t.decimal :standard_deviation, :default => 0, :precision => 7, :scale => 3

      t.timestamps null: false
    end
  end
end
