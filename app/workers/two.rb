class Two
  @queue = :two

  def self.perform(product_id)
    ActiveRecord::Base.logger = Logger.new(STDOUT)

    start = Time.now
    product = Product.find(product_id)
    ActiveRecord::Base.logger.info "product #{product.name} done in #{Time.now - start} seconds"
  end
end