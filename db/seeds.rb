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

question_data.each do |question|
  Question.create!(
    content: question[0],
    category: question[1],
    option1: "Option 1",
    option2: "Option 2",
    option3: "Option 3"
  )
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
