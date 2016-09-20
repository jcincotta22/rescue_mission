require 'factory_girl_rails'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "How do I make a form #{n}?" }
    description "Just do it"
  end
end
