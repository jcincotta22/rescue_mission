require 'rails_helper'

feature "Editing Questions" do
  let!(:questions) { FactoryGirl.create_list(:question, 15) }
  context "As a User" do
    context "I visit the questions' a question to edit" do
      before { visit questions_path }
      scenario "I click on the edit button and edit the question" do
        new_description = "IIIIIIIIIIIIIIIIIIIIIIIIIII am editing this new description that is long enoughhhhhhhhhhhhhh;aksdfj;alsdfkj;alsdkfj;alsdkfj;alskdfj!!!!!!!!!!!!!!!!!!!!"
        first_question = questions.first
        click_link(first_question.title)
        click_link('Edit')
        fill_in('question_description', with: new_description)
        click_button("Submit")
        expect(page).to have_content(new_description)
        expect(page).to have_content('Question was successfully updated.')
      end
      scenario "User edits question and erases the entire title" do
        first_question = questions.first
        click_link(first_question.title)
        click_link('Edit')
        fill_in('question_title', with: '')
        click_button("Submit")
        expect(page).to have_content("Title can't be blank")
      end
      scenario "User edits question and erases the entire description" do
        first_question = questions.first
        click_link(first_question.title)
        click_link('Edit')
        fill_in('question_description', with: '')
        click_button("Submit")
        expect(page).to have_content("Description can't be blank")
      end
    end
  end
end
