require 'rails_helper'

feature "Viewing questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }
  context "As a User" do
    context "I can visit the questions page" do
      before { visit questions_path }

      senario "and see each question" do
        questions.each do |q|
          expect(page).to have_content q.title
        end
      end
      xscenario "and see the most recent question first" do

      end
    end
  end
end
