json.array!(@developers) do |developer|
  json.extract! developer, :id
  json.url developer_url(developer, format: :json)
  json.avatar developer.avatar.url
  json.location developer.location
  json.description developer.description
  json.min_contract_amount developer.min_contract_amount
  json.distance developer.distance.round(2)
  json.username developer.username
  json.title developer.title
  json.skills developer.skills_names
  json.earnings developer.earnings
  json.favorited current_user.employer_favorites.pluck(:developer_id).include? developer.id
end