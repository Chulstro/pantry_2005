
class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient] == nil
      0
    else
      @stock[ingredient]
    end
  end
end
