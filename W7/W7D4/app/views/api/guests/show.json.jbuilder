json.partial! 'api/guests/guest'
json.gifts @guest.gifts, partial: 'api/gifts/gift', as: :gift
