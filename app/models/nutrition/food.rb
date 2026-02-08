module Nutrition
  class Food < ActiveRecord::Base
    belongs_to :food_group
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