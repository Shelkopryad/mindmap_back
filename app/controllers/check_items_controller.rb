class CheckItemsController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:index, :add_new]

  def index
    tags = params[:query].split(/[ ,]/).select { |it| !it.empty? }

    all_items_to_check = {}
    tags.each do |tag|
      items = CheckItem.joins(:tags).where(tags: { tag: tag }).map { |it| it.item_to_check }
      items.each do |item|
        if all_items_to_check.keys.include?(item)
          value = all_items_to_check[item]
          value << tag
          all_items_to_check[item] = value
        else
          all_items_to_check[item] = [tag]
        end
      end
    end

    right_array = []
    all_items_to_check.each do |item, tag_arr|
      right_array << {
        'item_to_check' => item,
        'tags' => tag_arr
      }
    end

    respond_to do |format|
      format.json  { render :json => right_array.to_json }
    end
  end

  def add_new
    binding.pry
    item_to_check = CheckItem.create(item_to_check: params['item_to_check'], to_test: false)

    tags = params['tags'].split(/[ ,]/).select { |it| !it.empty? }
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
end
