json.extract! @developer, :id, :created_at, :updated_at

json.ratings @developer.ratings, :developer_stars, :developer_review, :developer_reviewer_email