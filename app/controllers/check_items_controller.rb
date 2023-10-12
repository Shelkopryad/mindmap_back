class CheckItemsController < ApplicationController

  def index
    Rails.logger.info params[:query]
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

    ranked = {}
    all_items_to_check.each do |item, tag_arr|
      if tags.size == tag_arr.size
        ranked[:high] ||= []
        ranked[:high] << { item => tag_arr }
      else
        ranked[:low] ||= []
        ranked[:low] << { item => tag_arr }
      end
    end

    respond_to do |format|
      format.json  { render :json => ranked.to_json }
    end
  end

  def new
    @item_to_check = CheckItem.new
  end
end
