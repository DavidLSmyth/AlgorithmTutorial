require 'test_helper'

class AlgorithmTest < ActiveSupport::TestCase
  test "algorithm attributes must not be empty" do
		algorithm = Algorithm.new
		assert algorithm.invalid?
		assert algorithm.errors[:name].any?
		assert algorithm.errors[:description].any?
		assert algorithm.errors[:author].any?
		assert algorithm.errors[:link].any?
	end

	test "algorithm difficulty must be an integer between zero and ten" do
		algorithm = algorithms(:one)
		algorithm.difficulty = -8
		assert algorithm.invalid?
		assert algorithm.errors[:difficulty].any?

		algorithm.difficulty = 1
		assert algorithm.valid?
		assert algorithm.errors[:difficulty].none?
	
		algorithm.difficulty = 12
		assert algorithm.invalid?
		assert algorithm.errors[:difficulty].any?
	
		algorithm.difficulty = 4.5
		assert algorithm.invalid?
		assert algorithm.errors[:difficulty].any?
	end

	test "image url must point to an image file" do
  algorithm = algorithms(:one)
  ok = %w{ frog.gif frog.jpg frog.png FROG.PNG fRoG.PnG
           http://a.b.c/x/y/z/frog.png frog.jpeg }
  bad = %w{ frog.doc frog.png/less frog.png.less }

  ok.each do |url|
    algorithm.link= url	
		puts "The link is: "
		puts algorithm.inspect
		algorithm.valid?
		puts algorithm.errors.inspect
    assert algorithm.valid?, "#{url} should be a valid image url" 
  end

  bad.each do |url|
    algorithm.link = url
    assert algorithm.invalid?, "#{url} shouldn't be a valid image url"
  end
	end
end
