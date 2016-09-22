require 'rails_helper'

feature "Viewing questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }

  context "As a User" do
    context "I can visit the questions page" do
      before { visit questions_path }
      scenario "and see each question" do
        questions.each do |q|
          expect(page).to have_content q.title
        end
      end
      scenario "and see the most recent question first" do

        expect(page).to have_selector("td:first-child", text: questions.last.title)
      end
    end
  end
end
