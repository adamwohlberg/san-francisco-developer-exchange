json.array!(@contracts) do |contract|
  json.extract! contract, :id
  json.url contract_url(contract, format: :json)

  if contract.contract_avatar.present?
      json.avatar contract.contract_avatar.url
  else
      json.avatar contract.employer.avatar.url
  end

  json.description contract.description
  json.location contract.location
  # json.distance contract.distance
  json.amount contract.amount
  json.title contract.title
  json.skills contract.skills_names

  if current_user.type == 'Developer'
    json.favorited current_user.developer_favorites.pluck(:contract_id).include? contract.id
  end
  
end
