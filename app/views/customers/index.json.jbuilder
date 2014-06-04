json.array!(@customers) do |customer|
  json.extract! customer, :id, :name, :vat, :address, :cap, :city, :country, :admin_email, :note
  json.url customer_url(customer, format: :json)
end
