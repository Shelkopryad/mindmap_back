class CheckItemsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @result = []
  end

  def search
    tags = params[:search].split(/[ ,]/).select { |it| !it.empty? }
    items_to_check = []
    tags.each do |tag|
      items = CheckItem.joins(:tags).where(tags: { tag: tag.downcase }) #.map { |it| it.case_name }
      items.each do |item|
        items_to_check << item unless items_to_check.include?(item)
      end
    end

    @result = []
    items_to_check.each do |item_to_check|
      item_tags = Tag.joins(:check_items).where(check_items: { case_name: item_to_check.case_name }) #.map(&:tag)
      @result << {
        'item_to_check' => item_to_check,
        'tags' => item_tags.sort
      }
    end

    respond_to do |format|
      format.html { render 'index' }
      format.json  { render :json => @result.to_json }
    end
  end

  def new
    @check_item = CheckItem.new
  end

  def create
    item_to_check = CheckItem.create(case_name: params['check_item']['case_name'], test_case: params['check_item']['test_case'], to_test: false)

    tags = params['check_item']['tags'].split(/[ ,]/).select { |it| !it.empty? }
    tags_arr = []
    tags.each do |tag|
      if Tag.exists?(tag: tag.downcase)
        tags_arr << Tag.find_by(tag: tag.downcase).id
      else
        new_tag = Tag.create(tag: tag.downcase)
        tags_arr << new_tag.id if new_tag.persisted?
      end
    end

    tags_arr.each do |tag_id|
      CheckItemTag.create(check_item_id: item_to_check.id, tag_id: tag_id)
    end

    redirect_to new_check_item_path
  end

  def select_to_test
    update_items params, to_test: true

    redirect_to check_items_path
  end

  def tested
    update_items params, to_test: false

    redirect_to check_items_selected_to_test_path
  end

  def selected_to_test
    @selected = CheckItem.where(to_test: true)
  end

  private
  def update_items(params, to_test:)
    ids = params.keys.select{ |it| it.include?('to_test') }.each.map { |key| params[key] }
    ids.each do |id|
      CheckItem.find(id.to_i).update(to_test: to_test)
    end
  end
end
