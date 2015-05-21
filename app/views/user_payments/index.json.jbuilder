json.array!(@user_payments) do |user_payment|
  json.extract! user_payment, :id
  json.url user_payment_url(user_payment, format: :json)
end
