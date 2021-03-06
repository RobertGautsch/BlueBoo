# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Seeding starts"
User.destroy_all
puts "all users deleted"
Activity.destroy_all
puts "all activities deleted"
UserActivity.destroy_all if UserActivity.all
puts "all user_activities deleted"
Assessment.destroy_all if UserActivity.all
puts "all assessments deleted"
Question.destroy_all
puts "all questions deleted"
Answer.destroy_all
puts "all answers deleted"
Suggestion.destroy_all
puts "all suggestions deleted"
Resource.destroy_all
puts "all resources deleted"
Therapist.destroy_all
puts "all therapists deleted"
TherapistTherapyType.destroy_all
puts "all therapist therapy types deleted"
TherapyType.destroy_all
puts "all therapy types deleted"


user1 = User.new(
  email: "test@test.com",
  password: "123456",
  username: "myUsername"
)
user1.save!

puts "one user created"

activities = {
  "journaling" => "calming",
  "drinking a tea" => "calming",
  "meditating" => "calming",
  "reading" => "calming",
  "listening to a podcast" => "calming",
  "taking a walk" => "vitalizing",
  "dancing" => "vitalizing",
  "doing a workout" => "vitalizing",
  "playing video games" => "fun",
  "drawing" => "fun"
}

activities.each_key do |key|
  Activity.create!(
    category: activities[key],
    description: key
  )
end

puts "10 activities created"

question_data = [
  ["Have you eaten in the last four hours?", "nutrition"],
  ["Have you taken your medication?", "medication"],
  ["Have you slept more than 8 hours?", "rest"],
  ["Have you had two liters of water or more today?", "hydration"],
  ["Are you in physical pain?", "health"],
  ["Do you feel sweaty or dirty?", "hygiene"],
  ["Is your environment dirty or untidy?", "tidiness"],
  ["Have you been outside today?", "outside"],
  ["Are you comfortable alone/with the people around you?", "social"],
  ["Do you have something on your mind?", "worries"],
  ["Are you feeling anxious?", "anxiety"],
  ["Are you feeling depressed?", "depression"],
  ["Are you feeling dizzy?", "dizzyness"],
  ["Are you low on energy?", "energy level"],
  ["Do you feel calm?", "calmness"],
  ["Do you feel empty?", "emptyness"]
]

answer_options = [
  ["No, I need a meal", "I could use a snack", "Yes, not feeling hungry"],
  ["No and I can still take it", "No, but it's too late to take it now", "Yes or no need to take any"],
  ["No, I am very tired", "No, I am a bit sleepy", "Yes, I am well rested"],
  ["Not even close", "Not quite", "Yes, I am well hydrated"],
  ["Yes, I am in pain", "Something hurts a little", "No, I am not feeling any pain"],
  ["Yes and it bothers me", "I could use some refreshment", "No, I feel clean"],
  ["It's a mess or it's dirty", "It's a little untidy", "My environment looks good"],
  ["No, I haven't", "Yes, but it was a while ago", "Yes, I spent some time outside"],
  ["I am alone and I don't like it", "I am not alone and I don't like it", "I am comfortable"],
  ["Yes, I have", "I can't really do anything about it", "Nothing in particular"],
  ["I feel anxious", "A little bit", "Not at all"],
  ["I feel depressed", "A little bit", "Not at all"],
  ["I am feeling quite dizzy", "A little bit dizzy", "No, I am fine"],
  ["Yes, I have a hard time getting up", "I am a little low on energy", "No, I have a lot"],
  ["No, not at all", "Not really", "Yes, I am very calm"],
  ["Yes", "I am not sure", "No, I am feeling feelings"]
]

icon_urls = [
  "icon-food.png",
  "icon-meds.png",
  "icon-sleep.png",
  "icon-water.png",
  "icon-pain.png",
  "icon-hygiene.png",
  "icon-tydiness.png",
  "icon-outside.png",
  "icon-people.png",
  "icon-worry.png",
  "icon-anxiety.png",
  "icon-depression.png",
  "icon-dizzy.png",
  "icon-energy.png",
  "icon-calm.png",
  "icon-empty.png"
]

counter = 0
question_data.each do |question|
  Question.create!(
    content: question[0],
    category: question[1],
    icon_path: icon_urls[counter],
    option1: answer_options[counter][0],
    option2: answer_options[counter][1],
    option3: answer_options[counter][2]
  )
  counter += 1
end

puts "16 questions created"

assessment = Assessment.new
assessment.user = user1
assessment.save!

puts "one assessment created"

Question.all.each do |question|
  answer = Answer.new(
    content: Faker::Lorem.sentence(word_count: 2, supplemental: false, random_words_to_add: 4),
    answer_type: ["good", "neutral", "bad"].sample
  )
  answer.question = question
  answer.assessment = assessment
  answer.save!
end

puts "created an answer for each question, each answer containing between 2 and 6 words"

Question.all.each do |question|
  if question.category != "anxiety"

    suggestion1 = Suggestion.new(
      # title: Faker::TvShows::RuPaul.quote,
      # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
      title: "Great job!",
      content: "Eating well can improve your sense of wellbeing and your mood!"
    )
    suggestion1.question = question
    suggestion1.answer_type = "good"
    suggestion1.save!

    suggestion2 = Suggestion.new(
      # title: Faker::TvShows::RuPaul.quote,
      # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
      title: "Get a snack",
      content: "If you feel just slightly hungry you could have a snack, that could be fruit, veggies, nuts, crackers, cereal, a yogurt or something like chips or chocolate if you feel like it!"
    )
    suggestion2.question = question
    suggestion2.answer_type = "neutral"
    suggestion2.save!

    suggestion3 = Suggestion.new(
      # title: Faker::TvShows::RuPaul.quote,
      # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
      title: "Cook something for yourself",
      content: "If you have groceries at home, it might be nice to cook something for yourself. If you???re very hungry right NOW, maybe you can have something like a slice of bread for the start to satisfy that initial hunger and give you the necessary energy that you need for cooking a nice meal."
    )
    suggestion3.question = question
    suggestion3.answer_type = "bad"
    suggestion3.save!

    suggestion4 = Suggestion.new(
      # title: Faker::TvShows::RuPaul.quote,
      # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
      title: "Order something online",
      content: "A pricy option but a good solution when you don't have groceries at home or no energy to prepare something is ordering food online. To meet the minimum order amount while ordering for one person, you would even order some more to have your next lunch or dinner covered!"
    )
    suggestion4.question = question
    suggestion4.answer_type = "bad"
    suggestion4.save!

    suggestion5 = Suggestion.new(
      # title: Faker::TvShows::RuPaul.quote,
      # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
      title: "Accomodate yourself",
      content: "It might be a nice idea to sit down and listen to an interesting podcast while cutting ingredients."
    )
    suggestion5.question = question
    suggestion5.answer_type = "bad"
    suggestion5.save!

    suggestion6 = Suggestion.new(
      # title: Faker::TvShows::RuPaul.quote,
      # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
      title: "Quick meals",
      content: "If you want to make something super fast, you could go for something like pre-cooked Tortellini or pre-cooked rice and mix it with frozen veggies and a ready-made sauce in a glas.  A one-pot meal can be an easy-to-prepare choice that at the same time does not produce too many dirty dishes."
    )
    suggestion6.question = question
    suggestion6.answer_type = "bad"
    suggestion6.save!
  end
end

puts "one suggestion for each answer created"

# suggestions for anxiety

suggestion7 = Suggestion.new(
  # title: Faker::TvShows::RuPaul.quote,
  # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
  title: "Grounding exercises",
  content: "It can help to activate your senses to head away from your thoughts or to calm them. What can help is taking deep breaths, splash water in your face, make a tea and drink it slowly or listening to music."
)
suggestion7.question = Question.find_by(category: "anxiety")
suggestion7.answer_type = "neutral"
suggestion7.save!

suggestion8 = Suggestion.new(
  # title: Faker::TvShows::RuPaul.quote,
  # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
  title: "Journaling",
  content: "This is a great way of getting thoughts and spirals out of your head and onto the paper. And writing can have a very calming effect on us."
)
suggestion8.question = Question.find_by(category: "anxiety")
suggestion8.answer_type = "neutral"
suggestion8.save!

suggestion9 = Suggestion.new(
  # title: Faker::TvShows::RuPaul.quote,
  # content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
  title: "Talk it out",
  content: "Just as journaling, it can help to get out of your head by communicating what you are feeling. If you are alone, it can also help to say your name out loud, as a different form of grounding."
)
suggestion9.question = Question.find_by(category: "anxiety")
suggestion9.answer_type = "neutral"
suggestion9.save!

# copy for bad just for sure
# assign to anxiety question

puts "suggestions for anxiety created and assigned to anxiety question"

titles = [
  "When to seek out professional help?",
  "Choosing the right therapist for you",
  "How to find a therapist",
  "Types of therapy and their advantages",
  "How to find private therapists",
  "On the importance of mental health",
  "Supporting a person that is struggling with their mental health",
  "Mental health in youth",
  "Mental health in times of crisis",
  "Normalizing mental health"
]

images = [
  "resource6.jpg",
  "resource5.jpg",
  "resource1.jpg",
  "resource2.jpg",
  "resource3.jpg",
  "resource4.jpg",
  "resource2.jpg",
  "resource3.jpg",
  "resource1.jpg",
  "resource5.jpg"
]

resource_text = "If you???re considering therapy ??? whether it???s to restore a relationship, recover from a trauma, adjust to a new life phase, or improve your mental health ??? finding the right therapist is the first hurdle to cross.

Researchers have found that the bond between you and your therapist is likely to have a big impact on your growth. That???s why it???s important to do your research, ask questions, and pay attention to your own responses in your search for the therapist that???s right for you. Here are some tried-and-true methods for finding a therapist to help you reach your therapeutic goals.

If you plan to pay for therapy through your insurance plan, your first step might be to look through your plan???s provider network.

It???s also a good idea to find out whether your plan limits the number of sessions you can attend each year and whether using an out-of-network therapist will affect your out-of-pocket costs."

topics = %w[therapy mental\ health therapist]
image_counter = 0

titles.each do |title|
  Resource.create!(
    title: title,
    text: resource_text,
    topic: topics.sample,
    reading_duration: (rand(1..4) * 5),
    image_url: images[image_counter]
  )
  image_counter += 1
end

puts "10 resources created"

therapy_types = %w[Behavioral Cognitive-behavioral Psychoanalysis Psychodynamic Humanistic Integrative]

addresses_for_therapists = [
  # add 15 berlin addresses here
  "Brandenburgische Stra??e 8, 12279 Berlin",
  "Kiefholzstra??e 50, 12435 Berlin",
  "Karl-Marx-Stra??e 98, 12043 Berlin",
  "Tamara-Danz-Stra??e 11, 10243 Berlin",
  "Thiemannstra??e 11, 12059 Berlin",
  "Wrangelstra??e 53, 10997 Berlin",
  "Europaplatz 1, 10557 Berlin",
  "Am Ostbahnhof 9, 10243 Berlin",
  "Hermannstra??e 158, 12051 Berlin",
  "Rollbergstra??e 59, 12053 Berlin",
  "Rummelsburger Str. 16, 12459 Berlin",
  "Friedrichstra??e 100, 10117 Berlin",
  "Tempelhofer Weg 11, 12347 Berlin",
  "Yorckstra??e 78, 10965 Berlin",
  "Uhlandstra??e 30, 10719 Berlin",
  # add 10 hamburg addresses here
  "Tibarg 41, 22459 Hamburg",
  "Moltkestra??e 6, 20253 Hamburg",
  "Glockengie??erwall 5, 20095 Hamburg",
  "M??nckebergstra??e 4, 20095 Hamburg",
  "Ballindamm 40, 20095 Hamburg",
  "Dorotheenstra??e 116, 22301 Hamburg",
  "Kr??sistra??e 7, 22305 Hamburg",
  "Langenhorner Chaussee 666, 22419 Hamburg",
  "Altonaer Str. 67, 20357 Hamburg",
  "Wandsbeker Marktstra??e 1, 22041 Hamburg",
  # add 16 random addresses here
  "Thomas-M??ntzer-Platz 5, 01307 Dresden",
  "??u??ere Oybiner Stra??e 1a, 02763 Zittau",
  "Lichtentaler Str. 57, 76530 Baden-Baden  ",
  "Mannheimer Stra??e 34 70376 Stuttgart",
  "Rosenstrasse 53, 81630 M??nchen",
  "Eisenbahnstra??e 116, 04315 Leipzig",
  "Maistra??e 63, 80337 M??nchen",
  "Leopoldstra??e 180, 80804 M??nchen",
  "Hirschgartenallee 38, 80639 M??nchen",
  "Breite Str. 90, 50667 K??ln",
  "Hauptstra??e 68, 70567 Stuttgart",
  "Poststra??e 33, 68309 Mannheim",
  "Blumenstra??e 9, 79111 Freiburg im Breisgau",
  "Altendorfer Str. 2, 45127 Essen",
  "Husarenstra??e 3, 30163 Hannover",
  "Breitenweg 1, 28195 Bremen"
]

# berlin seeds
counter = 0
15.times do
  Therapist.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: addresses_for_therapists[counter],
    individual_therapy: [true, false].sample,
    group_therapy: [true, false].sample,
    available_places: [true, false].sample,
    waiting_time: (1..9).to_a.sample,
    telephone_number: "+4930 #{(1102928..9898397).to_a.sample}",
    therapy_type: therapy_types.sample
  )
  counter += 1
end

# hamburg seeds
10.times do
  Therapist.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: addresses_for_therapists[counter],
    individual_therapy: [true, false].sample,
    group_therapy: [true, false].sample,
    available_places: false,
    waiting_time: (1..9).to_a.sample,
    telephone_number: "+49799 #{(10298..99837).to_a.sample}",
    therapy_type: therapy_types.sample
  )
  counter += 1
end

# random city seeds
16.times do
  Therapist.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: addresses_for_therapists[counter],
    individual_therapy: [true, false].sample,
    group_therapy: [true, false].sample,
    available_places: [true, false].sample,
    waiting_time: (1..9).to_a.sample,
    telephone_number: "+49799 #{(10298..99837).to_a.sample}",
    therapy_type: therapy_types.sample
  )
  counter += 1
end

puts "46 therapists created"

# can be deleted at a later point in time

# therapy_types.each do |therapy_type|
#   TherapyType.create!(name: therapy_type)
# end
# puts "6 therapy types created"

# therapist = Therapist.first
# therapy_type = TherapyType.where(name: "Behavioral").first
# TherapistTherapyType.create!(therapist: therapist, therapy_type: therapy_type)

# therapist2 = Therapist.last
# therapy_type2 = TherapyType.where(name: "Psychoanalysis").first
# TherapistTherapyType.create!(therapist: therapist2, therapy_type: therapy_type2)

# puts "linked 2 therapists to therapy type"

puts "seeding done"
