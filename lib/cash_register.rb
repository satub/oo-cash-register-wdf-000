require 'pry'
class CashRegister
  attr_accessor :total, :last_transaction, :discount, :cart

  def initialize(employee_discount = 0)
    @total = 0
    @cart = Hash.new(0)
    @last_transaction = 0
    @last_title = ""
    @discount = employee_discount
  end

  def add_item(title, price, quantity = 1)
    @cart[title] = {quantity: , price: price }
    @total += price * quantity
    @last_title = title
    @last_transaction = price * quantity
  end

  #This might need some refactoring
  def items
    all_items = []
    @cart.collect do |item, data|
      data[:quantity].times do
        all_items << item
      end
    end
    all_items
  end


  def calculate_discount
    @total =  @total - @total * @discount /100
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      calculate_discount
      "After the discount, the total comes to $#{@total}."
    end
  end

##This should also manipulate the cart to remove to voided items...
  def void_last_transaction
    @cart.delete_if{|title, data| title == @last_title}
    @total -= @last_transaction

  end

end
