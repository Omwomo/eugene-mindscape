FactoryBot.define do
  factory :user do
    name { 'MyString' }
    photo { 'sample_photo.jpg' }
    bio { 'Lorem ipsum dolor sit amet.' }
    posts_counter { 0 }
  end
end
