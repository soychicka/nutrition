File.open("#{Nutrition::Engine.root}/lib/nutrition/data/SR28/FD_GROUP.txt", "r").each_line do |line|
  data = line.gsub(/~/,'').gsub(/\r\n/,'').split("^")
  food_group = Nutrition::FoodGroup.create(name:data.last)
  food_group.id = data[0]
  food_group.save

end
File.open("#{Nutrition::Engine.root}/lib/nutrition/data/SR28/NUTR_DEF.txt", "r").each_line do |line|
  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:id, :unit, :label, :name, :significant_figures, :position].zip(data)]
  record = Nutrition::Nutrient.create( input )
  record.id = input[:id]
  record.save
end
File.open("#{Nutrition::Engine.root}/lib/nutrition/data/SR28/LANGDESC.txt", "r").each_line do |line|
  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:legacy_id, :description].zip(data)]
  record = Nutrition::LangualFactor.create( input )
end
#
File.open("#{Nutrition::Engine.root}/lib/nutrition/data/SR28/FOOD_DES.txt", "r").each_line.with_index do |line, i|

    data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
    input = Hash[[:id, :nutrition_food_group_id, :description, :summary, :aliases, :manufacturer, :is_complete, :waste_description, :waste_yield, :origin, :nitrogen_protein_yield, :protein_calorie_yield, :fat_calorie_yield, :carb_calorie_yield].zip(data)]
    input[:is_complete] = true if input[:is_complete] == "Y"
    record = Nutrition::Food.create( input )
    record.id = input[:id]
    record.save

end


File.open("#{Nutrition::Engine.root}/lib/nutrition/data/SR28/NUT_DATA.txt", "r").each_line do |line|
  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:nutrition_food_id, :nutrition_nutrient_id,  :yield, :Num_Data_Pts, :Std_Error, :Src_Cd, :Deriv_Cd, :estimated_from, :is_fortified, :Num_Studies, :Min, :Max, :DF, :Low_EB, :Up_EB, :Stat_cmt,  :last_update, :CC ].zip(data)]
  record =  Nutrition::NutrientValue.create( input.select{|k, v| Nutrition::NutrientValue.attribute_names.include? k } )
end
@overflow = []

File.open("#{Nutrition::Engine.root}/lib/nutrition/data/SR28/WEIGHT.txt", "r").each_line do |line|
  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:nutrition_food_id, :seq,  :quantity, :unit, :mass, :datapoints, :standard_deviation ].zip(data)]
  record = Nutrition::Mass.create(input) rescue( @overflow << input)
end




File.open("#{Nutrition::Engine.root}/lib/nutrition/data/SR28/LANGUAL.txt", "r").each_line do |line|

  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:nutrition_food_id, :legacy_id ].zip(data)]
  food = Nutrition::Food.find input[:nutrition_food_id]
  lf = Nutrition::LangualFactor.where(legacy_id:input[:legacy_id]).first
  food.langual_factors << lf rescue nil
  food.save
end

