class TestCasesController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @result = []
  end

  def search
    @result = []
    tags_for_search = params[:search].split(/[ ,]/).select { |it| !it.empty? }
    test_cases = []
    tags_for_search.each do |tag|
      current_tag = TestCaseTag.find_by_tag(tag)
      test_cases += current_tag.test_cases
    end

    @result = test_cases

    respond_to do |format|
      format.html { render 'index' }
      format.json  { render :json => @result.to_json }
    end
  end

  def new
    @test_case = TestCase.new
  end

  def create
    new_case = TestCase.create(name: params[:test_case][:name], steps: params[:test_case][:steps], to_test: false)
    tags = params[:test_case][:tags].split(/[ ,]/).select { |it| !it.empty? }
    tags.each do |tag|
      if TestCaseTag.exists?(tag: tag.downcase)
        new_case.test_case_tags << TestCaseTag.find_by_tag(tag)
      else
        new_tag = TestCaseTag.create(tag: tag.downcase)
        new_case.test_case_tags << new_tag
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
    @selected = TestCase.where(to_test: true)
  end

  private
  def update_items(params, to_test:)
    ids = params.keys.select{ |it| it.include?('to_test') }.each.map { |key| params[key] }
    ids.each do |id|
      TestCase.find(id.to_i).update(to_test: to_test)
    end
  end


end
