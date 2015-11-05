File.open("lib/data/FD_GROUP.txt", "r").each_line do |line|
  data = line.gsub(/~/,'').gsub(/\r\n/,'').split("^")#.reject{|r| r.empty? || r == "^" }
  food_group = Nutrition::FoodGroup.create(name:data.last)
  food_group.id = data[0]
  food_group.save

end
File.open("lib/data/NUTR_DEF.txt", "r").each_line do |line|
  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")#.reject{|r| r.empty? || r == "^" }
  input = Hash[[:id, :unit, :label, :name, :significant_figures, :position].zip(data)]
  record = Nutrition::Nutrient.create( input )
  record.id = input[:id]
  record.save
end
File.open("lib/data/LANGDESC.txt", "r").each_line do |line|
  data = line.gsub(/~/,'').gsub(/\r\n/,'').split("^")#.reject{|r| r.empty? || r == "^" }
  input = Hash[[:legacy_id, :description].zip(data)]
  record = Nutrition::LangualFactor.create( input )
end
#
File.open("lib/data/FOOD_DES.txt", "r").each_line.with_index do |line, i|

    data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")#.reject{|r| r.empty? || r == "^" }
    input = Hash[[:id, :food_group_id, :description, :summary, :aliases, :manufacturer, :is_complete, :waste_description, :waste_yield, :origin, :nitrogen_protein_yield, :protein_calorie_yield, :fat_calorie_yield, :carb_calorie_yield].zip(data)]
    # input[:food_group_id] = input[:food_group].to_i
    record = Nutrition::Food.create( input )
    record.id = input[:id]
    record.save

end


File.open("lib/data/NUT_DATA.txt", "r").each_line do |line|
  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:food_id, :nutrient_id,  :yield, :Num_Data_Pts, :Std_Error, :Src_Cd, :Deriv_Cd, :estimated_from, :is_fortified, :Num_Studies, :Min, :Max, :DF, :Low_EB, :Up_EB, :Stat_cmt,  :last_update, :CC ].zip(data)]
  nutrient = Nutrition::Nutrient.where(id:input[:nutrient_id]).first
  record = nutrient.nutrient_values.create( input.select{|k, v| Nutrition::NutrientValue.attribute_names.include? k } )
end


File.open("lib/data/WEIGHT.txt", "r").each_line do |line|
  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:food_id, :seq,  :quantity, :unit, :mass, :datapoints, :standard_deviation ].zip(data)]
  food = Nutrition::Food.find(input[:food_id])
  record = food.masses.create(input)
end




File.open("lib/data/LANGUAL.txt", "r").each_line do |line|

  data = line.force_encoding('iso-8859-1').encode('utf-8').gsub(/~/,'').gsub(/\r\n/,'').split("^")
  input = Hash[[:food_id, :legacy_id ].zip(data)]
  food = Nutrition::Food.find input[:food_id]
  lf = Nutrition::LangualFactor.where(legacy_id:input[:legacy_id]).first
  food.langual_factors << lf rescue nil
  food.save
end

