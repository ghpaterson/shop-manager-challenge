require 'order'

class OrderRepository

    def all
        sql = 'SELECT id, customer, order_date, item_id FROM orders;'
        result_set = DatabaseConnection.exec_params(sql, [])
        orders = []

        result_set.each do |record|
            order = Order.new
            order.id = record['id'].to_i
            order.customer = record['customer']
            order.order_date = record['order_date']
            order.item_id = record['item_id'].to_i
            orders << order
        end
            return orders
    end

    def find(id)
        sql = 'SELECT id, customer, order_date, item_id FROM orders WHERE id = $1;'
        params = [id]
        result_set = DatabaseConnection.exec_params(sql, params)
        record = result_set[0]

        order = Order.new
        order.id = record['id'].to_i
        order.customer = record['customer']
        order.order_date = record['order_date']
        order.item_id = record['item_id'].to_i
        return order
    end
end