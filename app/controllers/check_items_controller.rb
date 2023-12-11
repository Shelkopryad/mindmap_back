class CheckItemsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index]

  def index
    @result = []
  end

  def search
    tags = params[:search].split(/[ ,]/).select { |it| !it.empty? }
    items_to_check = []
    tags.each do |tag|
      items = CheckItem.joins(:tags).where(tags: { tag: tag }) #.map { |it| it.item_to_check }
      items.each do |item|
        items_to_check << item unless items_to_check.include?(item)
      end
    end

    @result = []
    items_to_check.each do |item_to_check|
      item_tags = Tag.joins(:check_items).where(check_items: { item_to_check: item_to_check.item_to_check }) #.map(&:tag)
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
    item_to_check = CheckItem.create(item_to_check: params['check_item']['item_to_check'], to_test: false)

    tags = params['check_item']['tags'].split(/[ ,]/).select { |it| !it.empty? }
    tags_arr = []
    tags.each do |tag|
      if Tag.exists?(tag: tag)
        tags_arr << Tag.find_by(tag: tag).id
      else
        new_tag = Tag.create(tag: tag)
        tags_arr << new_tag.id if new_tag.persisted?
      end
    end

    tags_arr.each do |tag_id|
      CheckItemTag.create(check_item_id: item_to_check.id, tag_id: tag_id)
    end
  end

  def select_to_test
    binding.pry
  end
end
