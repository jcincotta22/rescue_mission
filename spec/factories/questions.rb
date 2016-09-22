require 'factory_girl'

FactoryGirl.define do
  factory :question do
    sequence(:title) { |n| "How do I make a formmmmmmmmmmmmmmmmmmmmmmmmmmmmmm #{n}?" }
    sequence(:description) do |n| "Just do itttttttttttttttttttttt
      asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdf
      asdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfasdfsadfasdfasdf
      ;aslkdjf;alskdfj;alskdfj;alsdfkj;lkj #{n}"
    end
  end
end
