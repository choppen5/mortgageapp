namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_companies
    make_case
    #make_microposts
    #make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "admin@test.com",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@test.com"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_companies
  Company.create(
      :name      => 'Company1',
      :email     => 'c1@test.com',
      :phone     => '111-111-1111',
      :address   => '1 test lane',
      :fax       => '1-111-111-1111',
      #:programs  => 'hamp',
      :handle    => 'handle1'
  )

  Company.create(
      :name      => 'Company2',
      :email     => 'c2@test.com',
      :phone     => '222-222-2222',
      :address   => '2 test lane',
      :fax       => '2-222-222-2222',
      #:programs  => 'hamp',
      :handle    => 'handle2'
  )

  Company.create(
      :name      => 'Company3',
      :email     => 'c3@test.com',
      :phone     => '333-333-3333',
      :address   => '3 test lane',
      :fax       => '3-333-333-3333',
      #:programs  => 'hamp',
      :handle    => 'handle3'
  )

  Company.create(
      :name      => 'Company4',
      :email     => 'c4@test.com',
      :phone     => '444-444-4444',
      :address   => '4 test lane',
      :fax       => '4-444-444-4444',
      #:programs  => 'hamp',
      :handle    => 'handle4'
  )

  Company.create(
      :name      => 'Company5',
      :email     => 'c5@test.com',
      :phone     => '555-555-5555',
      :address   => '5 test lane',
      :fax       => '5-555-555-5555',
      #:programs  => 'hamp',
      :handle    => 'handle5'
  )

  Company.create(
      :name      => 'Company6',
      :email     => 'c6@test.com',
      :phone     => '666-666-6666',
      :address   => '6 test lane',
      :fax       => '6-666-666-6666',
      #:programs  => 'hamp',
      :handle    => 'handle6'
  )

end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end

def make_case
  User.find_by_email('admin@test.com').cases.create(
    :description =>
"I bought my house in 2008 - for $300,000. It was a awesome, house, neighborhood, etc. Seemed like a great purchase.

The relestate market in Arizona has been tanking though.. getting worse and worse.

I saw that I qualified for the HAMP program, because my income is 35% of my housing cost if refinanced.

I started this mortgage application Process 2 months ago. I've been calling daily, but they still haven't finished my refi. Really frustrated.",
    :status => 'open',
    :company_id => 1
  )
end