require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.create(chefname: "John", email: "abc@ex.com")
		# @recipe = Recipe.new(name: "Gongbao Chicken", summary: "This is the most popular dish", description: "chicken, cucumber, penuts")
		# @recipe.chef = @chef 

		@recipe = @chef.recipes.build(name: "Gongbao Chicken", summary: "This is the most popular dish", description: "chicken, cucumber, penuts")
				
	end 

	test "a recipe should be linked to a chef" do 
		@recipe.chef_id = nil 
		assert_not @chef.valid?
	end 

	test 'recipe should be valid' do 
		assert @recipe.valid?
	end 

	test "name should be present" do
		@recipe.name = " "
		assert_not @recipe.valid?
	end  

	test "name should be less than 100 characters" do 
		@recipe.name = "a"*101
		assert_not @recipe.valid?
	end 

	test "name should be more than 5 characters" do 
		@recipe.name = "aaaa"
		assert_not @recipe.valid?
	end

	test "summary should be present" do 
		@recipe.summary = ""
		assert_not @recipe.valid?
	end 

	test "summary should be less than 100 char" do 
		@recipe.summary = "a" * 101
		assert_not @recipe.valid?
	end 

	test "summary should be more than 10 char" do 
		@recipe.summary = "a" * 9
		assert_not @recipe.valid?
	end 

	test "description should be present" do 
		@recipe.description = ""
		assert_not @recipe.valid?
	end 

	test "description should be less than 100 char" do 
		@recipe.description = "a" * 501
		assert_not @recipe.valid?
	end 

	test "description should be more than 10 char" do 
		@recipe.description = "a" * 19
		assert_not @recipe.valid?
	end 

end
