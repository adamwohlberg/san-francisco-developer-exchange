json.array!(@contracts) do |contract|
  json.extract! contract, :id
  json.url contract_url(contract, format: :json)
  json.avatar contract.employer.avatar.url
  json.description contract.description
  json.location contract.location
  # json.distance contract.distance
  json.amount contract.amount
  json.title contract.title
  json.skills contract.skills_names
  json.favorited current_user.developer_favorites.pluck(:contract_id).include? contract.id
end
