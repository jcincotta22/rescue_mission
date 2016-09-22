
 require 'rails_helper'

 feature "Deleting Questions" do
   let!(:questions) { FactoryGirl.create_list(:question, 15) }
   let!(:first_question) { questions.first }
   let!(:answer) { Answer.create(description: "This is a really long answer so it will pass the length test for my validations.", question_id: first_question.id)}
   context "As a User" do
     context "I visit a question and delete it" do
       before { visit questions_path }

       scenario "I click on the delete button and delete the question and all answers" do
         answer_id = answer.id
         click_link(first_question.title)
         click_link('Delete')
         expect(page).to have_content("Successfully deleted question")
         expect(page).to_not have_content(first_question.title)
         expect{ Answer.find(answer_id) }.to raise_error(ActiveRecord::RecordNotFound)
       end
     end
   end
 end
