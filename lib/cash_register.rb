class CashRegister

  attr_accessor :total, :discount, :employee_discount


  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @employee_discount = employee_discount
    @items_list = []
    @prices = []
  end

  def add_item(title, price, quantity=1)

    if quantity != 1
      @total = @total + (price * quantity)
    else
      @total = @total + price
    end
    quantity.times {@items_list << title}
    @prices << price
  end

  def apply_discount
    if discount == 0
      return 'There is no discount to apply.'
    else
     diss = @total * (discount.to_f / 100)
     @total -= diss
     return "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items_list
  end

  def void_last_transaction
    @total = @total - @prices[-1]
  end

end
