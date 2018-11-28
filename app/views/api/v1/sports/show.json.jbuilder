json.extract! @sport, :id, :title, :description, :category, :price, :photo, :province, :city, :district, :address, :latitude, :longitude, :capacity, :level, :user
json.start_time @sport.start_time.strftime("%Y-%m-%d %H:%M")
json.end_time @sport.end_time.strftime("%Y-%m-%d %H:%M")
# , :bookings, :messages
json.messages @sport.messages do |message|
  json.extract! message, :id, :content, :created_at, :user
  json.replies message.replies do |reply|
    json.extract! reply, :id, :content ,:user_id
    json.user reply.user
    json.reply_time reply.created_at.strftime("%Y-%m-%d %H:%M")
  end
  json.msg_time message.created_at.strftime("%Y-%m-%d %H:%M")
  # json.booking_user message.booking.user
end

json.bookings @sport.bookings do |booking|
  json.extract! booking, :id, :user
  json.join_time booking.created_at.strftime("%m/%d/%y")
end

