json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :number, :emission_date, :ammount, :vat, :customer_id
  json.url invoice_url(invoice, format: :json)
end
