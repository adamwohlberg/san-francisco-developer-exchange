json.array!(@negotiations) do |negotiation|
  json.extract! negotiation, :id
  json.url negotiation_url(negotiation, format: :json)
end
