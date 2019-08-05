class GistQuestionService

  #attr_reader :client

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      #description: "A question about #{@test.title} from TestGuru",
      description: I18n.t('admin.gists.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.question]
    content += @question.answers.pluck(:answer)
    content.join("\n")
  end

end
