
class CashRegister
    attr_reader :discount
    attr_accessor :total, :items, :prev_total
    def initialize (discount=20, total=0)
        @discount = discount
        @total = total
        @items = []
    end

    def add_item title= 'eggs', price= 1, quantity=1
        self.prev_total = price * quantity
        self.total += (price * quantity)
        quantity.times do
            self.items << title
        end
    end

    def apply_discount
        self.total= self.total - ((self.total * self.discount) / 100)
        self.total > 0 ? 
        "After the discount, the total comes to $#{self.total}." :  "There is no discount to apply."
    end

    def void_last_transaction 
        self.total -= self.prev_total
    end
end
