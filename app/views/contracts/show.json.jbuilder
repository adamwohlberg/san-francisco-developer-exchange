json.extract! @contract, :id, :name, :description, :title, :amount, :skills, :created_at, :updated_at

json.ratings @contract.ratings, :employer_stars, :employer_review, :employer_reviewer_email
