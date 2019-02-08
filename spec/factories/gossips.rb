FactoryBot.define do
  factory :gossip do
    title {"Gossip de ouf"}
    content{"Ceci est un gossip de ouf !"}
    user {User.create}
  end
end
