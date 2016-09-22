require 'rails_helper'

feature "Viewing questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }
  context "As a User" do
    context "I visit the questions' page and click on a question" do
      before { visit questions_path }
      scenario "and see the questions details" do
        first_question = questions.first
        click_link(first_question.title)
        expect(page).to have_content first_question.title
        expect(page).to have_content first_question.description
      end
    end
  end
end
