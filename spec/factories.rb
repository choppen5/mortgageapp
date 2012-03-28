FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"

    factory :admin do
      admin true
    end
  end

  factory :micropost do
    content "Lorem ipsum"
    user
  end

  factory :case do
    description "Lorem ipsum"
    status "open"
    association :user, :factory => :user, :name => 'Case User'
    association :company, :factory => :company, :name => 'Case Company'
  end

  factory :company do
    name    'Company1'
    email   'c1@test.com'
    phone   '111-111-1111'
    address '1 test lane'
    fax     '1-111-111-1111'
    handle  'handle1'
  end
end