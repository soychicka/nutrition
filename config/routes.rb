Nutrition::Engine.routes.draw do
  resources :masses
  resources :nutrient_values
  resources :foods
  resources :langual_factors
  resources :nutrients
  resources :food_groups
end
