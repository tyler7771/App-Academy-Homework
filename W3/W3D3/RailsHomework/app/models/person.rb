class Person
  validates :name, presence: true
  has_one :house
    primary_key: :id,
    forign_key: :house_id,
    class_name: 'House'

end
