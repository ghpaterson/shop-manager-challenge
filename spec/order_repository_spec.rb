require 'order_repository'
require 'order'

def reset_orders_table
    seed_sql = File.read('spec/seeds_orders.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_manager_test' })
    connection.exec(seed_sql)
end
  
  RSpec.describe ItemRepository do
    before(:each) do 
      reset_orders_table
    end

    it "lists all the orders from the shop" do
        repo = OrderRepository.new

        orders = repo.all

        expect(orders.length).to eq 2

        expect(orders[0].id).to eq 1
        expect(orders[0].customer).to eq 'Jake'
        expect(orders[0].order_date).to eq '2022-01-30'
        expect(orders[0].item_id).to eq 1

        expect(orders[1].id).to eq 2
        expect(orders[1].customer).to eq 'Sophie'
        expect(orders[1].order_date).to eq '2022-01-01'
        expect(orders[1].item_id).to eq 2
    end
end