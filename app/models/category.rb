class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '施工前' },
    { id: 3, name: '施工中' },
    { id: 4, name: '施工完了' },
  ]

  include ActiveHash::Associations
  has_many :diaries
end
