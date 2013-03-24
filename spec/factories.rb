FactoryGirl.define do
	factory :user do
		name_first	"David"
		name_middle "Scott"
		name_last "Johnson"
		user_name "fortjohnson"
		email "fortjay81@gmail.com"
		password "foobar"
		password_confirmation "foobar"
	end
end