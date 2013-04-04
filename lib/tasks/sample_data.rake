namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name_first: "Example",
                 name_last: "User",
                 user_name: "ExUser",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name_first = Faker::Name.first_name
      name_last = Faker::Name.last_name
      user_name = "User#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name_first: name_first,
                   name_last: name_last,
                   user_name: user_name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end

    users = User.all(limit: 6)
    40.times do |n|
      name = "Recipe Name #{n+1}"
      description = Faker::Lorem.sentences(2)
      category = "Cat 1"
      directions = Faker::Lorem.sentences(4)
      servings = 8
      total_cook_time = "10 mins"
      total_prep_time = "45 mins"
      users.each { |user| user.recipes.create!(recipe_name: name, description: description, recipe_category: category, directions: directions, servings: servings, total_prep_time: total_prep_time, total_cook_time: total_cook_time) }
    end

    40.times do |n|
      product_name = "Product #{n+1}"
      manufacturer_id = 2
      description = "Test Product"
      Product.create!(product_name: product_name, manufacturer_id: manufacturer_id, description: description)
    end

    recipes = Recipe.all(limit: 10)
    recipes.each do |recipe|
      5.times do |n|
        recipe.contains!(Product.find(n+1), 3, "Cups")
      end
    end
  end
end