FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    email { "johndoe@mail.com" }
    description {"Ma jolie description"}
    age {18}
    city {City.create}
  end
end

# user = FactoryBot.create(:user)
# puts user
