class Item < ApplicationRecord
  #attr_accessor :price, :name, :real, :weight, :description не работает!не выводить название товара а только ссылку на них
  mount_uploader :image, ImageUploader

  validates :price, numericality: { greater_than: 0, allow_nill: true }
  validates :name, presence: true

# можно посмотреть в каких корзинах есть товар
  has_many :positions
  has_many :carts, through: :positions

  has_many :comments #, as: :commentable

  has_and_belongs_to_many :orders

end
