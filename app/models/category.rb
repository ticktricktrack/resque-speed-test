class Category < ActiveRecord::Base
  has_many :products
  attr_accessible :name

  def start
    Resque.enqueue(One, self.id)
  end
end
