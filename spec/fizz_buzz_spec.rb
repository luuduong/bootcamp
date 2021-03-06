require "spec_helper"



class FizzBuzz
  def run(input)
   puts "result for #{input} is #{input % 3 == 0 ? 'Fizz' : input % 5 == 0 ? 'Buzz' : 'FizzBuzz'}"
   #puts "result is #{input}"
  end

  def include(thing) #wonder why this won't work and gives undefined method?
    match = false
    each do |t|
      match = true if t == thing
    end
    match
  end

end

describe "FizzBuzz" do
  let(:sut) { FizzBuzz.new }

  context "when the input is a multiple of 3" do
    xit "should return Fizz" do
      (1..10).each do |n|
        result = sut.run(n*3)
        result.should include("Fizz")
      end
    end
  end

  context "when the input is a multiple of 5" do
    xit "should say Buzz" do
      (1..10).each do |n|
        result = sut.run(n*5)
        result.should include("Buzz")
      end
    end
  end

  context "when the input is not a multiple of 3" do
    xit "should not say Fizz" do
      100.times do |n|
        next if n % 3 == 0
        sut.run(n).should_not include("Fizz")
      end
    end
  end

  context "when the input is not a multiple of 5" do
    xit "should not say Buzz" do
      100.times do |n|
        next if n % 5 == 0
        sut.run(n).should_not include("Buzz")
      end
    end
  end
end
