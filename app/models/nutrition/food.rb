module Nutrition
  class Food < ActiveRecord::Base
    # create_nutrition_foods makes nutrition_food_group_id, so the
    # food_group_id this would otherwise infer has never existed. has_many
    # :masses below already names the prefixed key; the belongs_to was missed.
    #
    # Optional because a large share of the USDA import carries no food group
    # at all -- two thirds of it in the data this was measured against -- and
    # requiring it would make those rows unsaveable.
    belongs_to :food_group, foreign_key: :nutrition_food_group_id, optional: true
    has_many :masses, :foreign_key => :nutrition_food_id

    # The other side of Nutrient's has_many. Both keys have to be named: the
    # join table is nutrition_nutrient_values and its columns are
    # nutrition_food_id and nutrition_nutrient_id, so every key Rails would
    # infer here (food_id, nutrient_id) is a column that has never existed.
    #
    # class_name is spelled out rather than left to the namespace so this reads
    # the same from outside Nutrition.
    #
    # No dependent: on purpose. These are 2,640,433 rows of USDA reference data
    # and which of the two nutrient-value tables is authoritative is still an
    # open question, so nothing here should start cascading deletes through it.
    # Declared explicitly so the choice is visible rather than defaulted.
    has_many :nutrient_values,
             class_name: "Nutrition::NutrientValue",
             foreign_key: :nutrition_food_id,
             inverse_of: :food,
             dependent: nil
    has_many :nutrients,
             through: :nutrient_values,
             source: :nutrient
    has_and_belongs_to_many :langual_factors
    
    scope :fn, -> (str) {named(str).to_rel.db.order("length(name)") } do
      # def method_name
      #
      # end
    end
    scope :named, -> (str) {
      search( str,  
      fields:["name^10",:description, :aliases, :origin], 
      misspellings: { below: 5}
      ).results#.to_rel.db#.order("length(name)")#,
     }
  end
end