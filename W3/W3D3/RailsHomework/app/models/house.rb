class House
  belongs_to :person,
    primary_key: :id,
    forign_key: :person_id,
    class_name: 'Person'
end
