module QuestionsHelper

  def question_header
    if @question.persisted?
      "Edit #{@test.title} Question"
    else
      "Create New #{@test.title} Question"
    end
  end

end
