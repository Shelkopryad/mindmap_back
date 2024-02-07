class TestCasesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @result = []
  end

  def search
    @result = []
    tags_for_search = params[:search].split(/[ ,]/).reject(&:empty?)
    tags_for_search.each do |tag|
      @result << TestCase.by_tag(tag) if TestCaseTag.exists?(tag: tag.downcase)
    end

    @result.flatten!
    render :index
  end

  def new
    @test_case = TestCase.new
  end

  def create
    new_case = TestCase.create(test_case_params)
    if new_case.valid?
      tags = tag_params.split(/[ ,]/).reject(&:empty?)
      tags.each do |tag|
        if TestCaseTag.exists?(tag: tag.downcase)
          new_case.test_case_tags << TestCaseTag.find_by_tag(tag)
        else
          new_tag = TestCaseTag.create(tag: tag.downcase)
          new_case.test_case_tags << new_tag
        end
      end
    end

    redirect_to new_test_case_path
  end

  def select_to_test
    update_items params, to_test: true

    redirect_to test_cases_path
  end

  def tested
    update_items params, to_test: false

    redirect_to test_cases_selected_to_test_path
  end

  def selected_to_test
    @selected = TestCase.in_test
  end

  private
  def test_case_params
    params.require(:test_case).permit(:name, :steps).merge(to_test: false)
  end

  def tag_params
    params.require(:test_case).permit(:tags).values.first
  end

  def update_items(params, to_test:)
    ids = params.keys.select{ |it| it.include?('to_test') }.each.map { |key| params[key] }
    ids.each do |id|
      TestCase.find(id.to_i).update(to_test: to_test)
    end
  end
end
