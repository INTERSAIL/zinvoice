json.array!(@supports) do |support|
  json.extract! support, :id, :customer_id, :from, :to, :ammount, :status, :desc, :note
  json.url support_url(support, format: :json)
end
