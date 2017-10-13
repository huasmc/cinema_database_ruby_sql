

class Ticket
  attr_accessor :id, :customer_id, :film_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING *"
    values = [@customer_id, @film_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def self.all()
    sql = "SELECT FROM customers"
    values = []
    results = SqlRunner.run(sql, values)
    customers = results.map {|result| Customer.new(result)}
    return customers
  end
end
