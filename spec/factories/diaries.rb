FactoryBot.define do
  factory :diary do
    association :user

    category_id       {Faker::Number.between(from: 2, to: 4)}
    place             {Faker::Name.name}
    work              {Faker::Lorem.context}
    start_time        {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)}
    ending_time       {Faker::Time.between(from: DateTime.now, to: DateTime.now + 1)}

    after(:build) do |diary|
      diary.image.attach(io: File.open('public/image/test2-image.png'), filename: 'test2-image.png')
    end
  end
end
