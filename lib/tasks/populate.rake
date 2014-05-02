namespace :db do
	desc "Populate the ingredients database with USDA db"
 	task :ingredients => :environment do 
		file = File.open("vendor/usda_db.txt")
		ingredients = []
		split_description = []
		ingredients_description = []

		file.each_line do |line|
			line.gsub!(/~/, '')
			ingredients_description << line.split('^')[2].downcase
		end
			
		ingredients_description.each do |description|
			split_description << description.split(', ')
		end

		split_description.each do |ingredient|
			ingredients << ingredient[0..1].join(' ')
		end

		unique_ingredients = ingredients.uniq

 		unique_ingredients.each do |ingredient|
 			Ingredient.create(:name => ingredient)
 		end
	end
end