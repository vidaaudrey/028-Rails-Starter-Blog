require 'test_helper'

class ChefTest < ActiveSupport::TestCase

	def setup
		@chef = Chef.new(chefname: "John Myer", email: "test@example.com")
	end 

	test "chefname should be present" do 
		@chef.chefname = ""
		assert_not @chef.valid?
	end 

	test "chefname should be less than 40 char" do 
		@chef.chefname = "a" * 41
		assert_not @chef.valid?
	end 

	test "chefname should be more than 3 char" do 
		@chef.chefname = "a" * 2
		assert_not @chef.valid?
	end 

	test "email should be present" do 
		@chef.email = ""
		assert_not @chef.valid?
	end 

	test "email should be less than 105 char" do 
		@chef.email = "a" * 100 + "@example.com"
		assert_not @chef.valid?
	end 

	test "email must be unique" do 
		dup_chef = @chef.dup 
		dup_chef.email = @chef.email.upcase 
		@chef.save 
		assert_not dup_chef.valid?
	end 

	# test "email validation should accept valid addresses" do
	# 	valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]

	# 	valid_addresses.each do |va|
	# 		@chef.email = va
	# 		assert @chef.valid?, '#{va.inspect} should be valid'
	# 	end
	# end


	test "email validation should accept valid" do 
		addressess = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@au.la laura+joe@monk.jm]
		addressess.each do |x|
			@chef.email = x 
			assert @chef.valid?, "#{x.inspect} should be valid email"
		end 
	end 

	test "email validation should reject  invalid" do 
		addresses = %w[user@example,com user_at_ee.org user.name@example. eee@i_am_.com foo@ee+arr.com]
		addresses.each do |x|
			@chef.email = x 
			assert_not @chef.valid? , "#{x.inspect} should be invalid"
		end 
	end
end
