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
  ["Have you eaten in the last four hours?", 'food'],
  ["Have you taken your medication?", 'medication'],
  ["Have you slept more than 8 hours?", 'sleep'],
  ["Have you had two liters of water or more today?", 'water'],
  ["Are you in physical pain?", 'pain'],
  ["Do you feel sweaty or dirty?", 'hygiene'],
  ["Is your environment dirty or untidy?", 'tidyness'],
  ["Have you been outside today?", 'outside'],
  ["Are you comfortable alone/with the people around you?", 'people'],
  ["Do you have something on your mind?", 'worries'],
  ["Are you feeling anxious?", 'anxiety'],
  ["Are you feeling depressed?", 'depressed'],
  ["Are you feeling dizzy?", 'dizzy'],
  ["Are you low on energy?", 'energy'],
  ["Do you feel calm?", 'calm'],
  ["Do you feel calm?", 'empty']
]

answer_options = [
  ["No, I need a meal", "I could use a snack", "Yes, not feeling hungry"],
  ["No and I can still take it", "No, but it's too late to take it now", "Yes or no need to take any"],
  ["No, I am very tired", "No, I am a bit sleepy", "Yes, I am well rested"],
  ["Not even close", "Not quite", "Yes, I am well hydrated"],
  ["Yes, I am in pain", "Something hurts a little", "No, I am not feeling any pain"],
  ["I don't feel clean and it bothers me", "I could use some refreshment", "No, I feel clean"],
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
counter = 0
question_data.each do |question|
  Question.create!(
    content: question[0],
    category: question[1],
    # option1: "option 1",
    # option2: "option 2",
    # option3: "option 3"
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
  suggestion1 = Suggestion.new(
    title: Faker::TvShows::RuPaul.quote,
    content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
  )
  suggestion1.question = question
  suggestion1.answer_type = "good"
  suggestion1.save!

  suggestion2 = Suggestion.new(
    title: Faker::TvShows::RuPaul.quote,
    content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
  )
  suggestion2.question = question
  suggestion2.answer_type = "bad"
  suggestion2.save!

  suggestion3 = Suggestion.new(
    title: Faker::TvShows::RuPaul.quote,
    content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
  )
  suggestion3.question = question
  suggestion3.answer_type = "neutral"
  suggestion3.save!

  suggestion4 = Suggestion.new(
    title: Faker::TvShows::RuPaul.quote,
    content: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 30)
  )
  suggestion4.question = question
  suggestion4.answer_type = "neutral"
  suggestion4.save!
end

puts "one suggestion for each answer created"

titles = [
  "How to find a therapist",
  "Choosing the right therapist for you",
  "Types of therapy and their advantages",
  "When to seek out professional help?",
  "How to find private therapists",
  "On the importance of mental health",
  "Supporting a person that is struggling with their mental health",
  "Mental health in youth",
  "Mental health in times of crisis",
  "Normalizing mental health"
]

topics = %w[therapy mental\ health therapist]

titles.each do |title|
  Resource.create!(
    title: title,
    text: Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 10),
    topic: topics.sample,
    reading_duration: (rand(1..4) * 5)
  )
end

puts "10 resources created"
puts "seeding done"
