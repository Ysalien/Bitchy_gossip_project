require 'faker'


  10.times do
    user = User.create!(username: Faker::Name.name,
      email: Faker::Internet.email,
      password: Faker::Internet.password)
  end

  20.times do
    gossip = Gossip.create!(title: Faker::SiliconValley.invention,
      content: Faker::NewGirl.quote,
      user_id: Faker::Number.between(User.first.id, User.last.id))
  end

  20.times do
    comment = Comment.create!(content:Faker::HitchhikersGuideToTheGalaxy.quote,
      gossip_id: Faker::Number.between(Gossip.first.id, Gossip.last.id),
      user_id: Faker::Number.between(User.first.id, User.last.id))
  end
