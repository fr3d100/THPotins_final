FactoryBot.define do
  factory :private_message do
    content {"My super Private message"}
    sender {User.create}
  end
end
