json.array!(@companies) do |company|
  json.extract! company, :id, :name, :size, :year, :industry, :revenue
  json.url company_url(company, format: :json)
end
