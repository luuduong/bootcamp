require "spec_helper"

def fibonacci(n)
n == 0 ? 0: n == 1 ? 1 : (fibonacci(n-1) + fibonacci(n-2))

  #qty == 0 ? 'none' : qty == 1 ? 'one' : 'many'
  #0, 1, 1, 2, 3, 5, 8, 13, 21, etc.
end

def fibonacci_enumerator

def take(n)
  @dothis = n
end

def include?(thenumbers)
return 0
end

end




describe "fibonacci" do
  it "should return the first n numbers in fibonacci" do
    f = ->(x){ x < 2 ? x : f.call(x-1) + f.call(x-2) }
    20.times do |n|
      fibonacci(n).should == f.call(n)
    end
  end

  it "can enumerate forever" do
    results = fibonacci_enumerator.take(18)
    f = ->(x){ x < 2 ? x : f.call(x-1) + f.call(x-2) }
    18.times do |n|
      results.should include(f.call(n))
    end
  end
end

