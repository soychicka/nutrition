Nutrition::Engine.routes.draw do
  resources :masses
  resources :nutrient_values
  # autocomplete_description_foods_path. The host application's ingredient views
  # have always called this helper; the engine never defined it, so /ingredients
  # and every ingredient subtype raised NoMethodError on a RoutesProxy.
  #
  # Not the rails-autocomplete macro: that names its action
  # autocomplete_<model>_<attribute>, which would be
  # autocomplete_food_description_foods_path. The callers want this name.
  resources :foods do
    get :autocomplete_description, on: :collection
  end
  resources :langual_factors
  resources :nutrients
  resources :food_groups
end
