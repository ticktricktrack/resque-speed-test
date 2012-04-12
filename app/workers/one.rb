class One
  @queue = :one

  def self.perform(category_id)
    category = Category.find(category_id)
    category.products.each do |p|
      Resque.enqueue(Two, p.id)
    end
  end

end