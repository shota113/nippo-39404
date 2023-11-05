FactoryBot.define do
  factory :user do
    first_name              {'太郎'}
    last_name               {'鈴木'}
    first_name_kana         {'タロウ'}
    last_name_kana          {'鈴木'}
    email                   {Faker::Internet.free_email}
    password                {'2b' + Faker::Internet.password(min_length: 8,max_length: 16)}
    password_confirmation   {password}
    company                 {Faker::Internet.name}
    number                  {Faker::Internet.free_number}
  end
end
