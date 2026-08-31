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