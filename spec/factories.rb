FactoryGirl.define do
  factory :link do
    title 'Testing Rails'
    url 'http://testingrailsbook/com'
  end

  trait :invalid do
    title nil
  end
end
