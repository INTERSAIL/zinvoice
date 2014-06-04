json.array!(@invoice_rows) do |invoice_row|
  json.extract! invoice_row, :id, :invoice_id, :desc, :value
  json.url invoice_row_url(invoice_row, format: :json)
end
