class Fizzbuzz
  MAX_VALUE = 100_000_000_000
  PER_PAGE = 10
  DEFAULT_TOTAL = 100

  # name of the key in session store
  def self.format(id)
    "fizzbuzz-#{id}"
  end

  def self.populate(total_str = nil)
    total = total_str ? total_str.to_f : DEFAULT_TOTAL
    return if total > MAX_VALUE
    (1..total).map { |elem| { key: elem, value: calculate(elem) } }
  end

  def self.calculate(arg)
    return 'FizzBuzz' if (arg % 15).zero?
    return 'Fizz' if (arg % 3).zero?
    return 'Buzz' if (arg % 5).zero?
    arg.to_s
  end
end
