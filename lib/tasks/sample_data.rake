namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = Account.create!(name: "Administrator Account",
                 email: "admin@olph.com",
                 password: "foofoo12",
                 password_confirmation: "foofoo12")
    admin.toggle!(:admin)

    3.times do
      workername = Faker::Name.name
      admin.workers.build(name: workername)
    end

    
    80.times do |n|
      name  = Faker::Name.last_name + " Account"
      email = "example-#{n+1}@olph.com"
      password  = "password"
      acct = Account.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
      

    end

    
    accounts = Account.all
    3.times do
      workername = Faker::Name.name
      accounts.each { |account| account.workers.create!(name: workername) }
    end


    

  end
end