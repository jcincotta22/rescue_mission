require 'rails_helper'

feature "Viewing questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }
  let!(:first_question) { questions.first }
  context "As a User" do
    context "I want to post question" do
      before do
        visit questions_path
        click_link("Ask a Question")
      end
      scenario "and see a link to a form" do
        expect(page).to have_content("New Question")
      end
      scenario "title must be provided and greater than 40 characters" do

        title = "this title is too short"
        good_title = "this title is definately long enought to pass the test"
        description = "description to test questionasd;fljas;dlkfj;asldfkj;asldfkja;lsdfkj;asldkfj;alsdkfj;asldkfasdfasdfasdfasdfasdfasdfj;alsdfkj;alsdfkj;lasdfkj;asldkjf;alsdfjk"
        fill_in 'question_title', with: title
        fill_in 'question_description', with: description
        click_button("Submit")
        expect(page).to have_content("Title is too short")

        fill_in 'question_title', with: good_title
        fill_in 'question_description', with: description
        click_button("Submit")
        expect(page).to have_content("Question was successfully created.")
      end
      scenario "user submits empty description" do
        good_title = "A longer title that is over 40 characters!!!!!"
        fill_in 'question_title', with: good_title
        click_button("Submit")
        expect(page).to have_content("Description can't be blank")
      end
      scenario "user submits empty description and empty title and empty description" do
        click_button("Submit")
        expect(page).to have_content("Description can't be blank")
        expect(page).to have_content("Title can't be blank")
      end
    end
  end
end
