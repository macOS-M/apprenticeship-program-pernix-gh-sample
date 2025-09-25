class Order
    def initialize(items)
      @items = items
    end
  
    def calculate_total
      total = 0
      @items.each do |item|
        total += item.price
      end
      total
    end
  
    def send_confirmation_email
      # Lógica para enviar un correo electrónico de confirmación
      puts "Email enviado a customer@example.com"
    end
  
    def print_order
      @items.each do |item|
        puts "Item: #{item.name} - Price: #{item.price}"
      end
    end
  end
  
  class Item
    attr_accessor :name, :price
  
    def initialize(name, price)
      @name = name
      @price = price
    end
  end
  