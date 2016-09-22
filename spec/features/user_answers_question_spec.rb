require 'rails_helper'

feature "Answering Questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }
  let!(:first_question) { questions.first }
  let!(:answer) {Answer.create(description: "This is a really long answer so it will pass the length test for my validations.", question_id: first_question.id)}
  let!(:answer2) {Answer.create(description: "This is a NOT really long answer so it will pass the length test for my validations.", question_id: first_question.id)}
  context "As a User" do
    context "I visit the questions page and click on a question" do
      before do visit questions_path
        click_link(first_question.title)
      end
      scenario "and input an answer" do
        description = "Answer to your question is longer than 40 characters"
        fill_in 'answer_description', with: description
        click_button("Submit")
        expect(page).to have_content(description)
      end
      scenario "user inputs answer that is too short" do
        short_description = "short description"
        fill_in 'answer_description', with: short_description
        click_button("Submit")
        expect(page).to have_content("Description is too short")
      end
      scenario "user inputs blank answer" do
        click_button("Submit")
        expect(page).to have_content("Description can't be blank")
      end
      scenario "and see the most recent answer first" do

        expect(page).to have_selector("li:last-child", text: answer2.description)
      end
    end
  end
end
