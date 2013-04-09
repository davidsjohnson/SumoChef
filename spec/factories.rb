FactoryGirl.define do
	factory :user do
		name_first	"David"
		name_middle "Scott"
		name_last "Johnson"
		user_name "exuser"
		email "fortjay81@gmail.com"
		password "foobar"
		password_confirmation "foobar"
	end

	factory :product do
		product_name "Cheese"
		description "This is Cheese!"
		manufacturer_id 1
	end

	factory :recipe do
		description "Food Recipe with ingredients 1 2 and 3"
		directions "1.  Do a bunch of stuff\n2.  Do some more stuff\n3.  Finally And Done!"
		recipe_category "Meat"
		recipe_id 1
		recipe_name "Recipe of Food"
		servings 8
		total_cook_time "30 Min"
		total_prep_time "1 hour"
		user
	end

end