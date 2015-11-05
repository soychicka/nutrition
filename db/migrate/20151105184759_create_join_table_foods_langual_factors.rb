class CreateJoinTableFoodsLangualFactors < ActiveRecord::Migration
  def change
    create_join_table :foods, :langual_factors, table_name:"nutrition_foods_langual_factors" do |t|
      # t.index [:food_id, :langual_factor_id]
      # t.index [:langual_factor_id, :food_id]
    end
  end
end
