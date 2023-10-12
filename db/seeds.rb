# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CheckItem.new(item_to_check: 'заказ открывается в МА и CRM и показывает одинаковые данные', to_test: false).save
CheckItem.new(item_to_check: 'экспорт данных по заказам', to_test: false).save
CheckItem.new(item_to_check: 'изменение цены у продукта отображается при добавлении его в заказ', to_test: false).save
CheckItem.new(item_to_check: 'продукт создаётся и виден как в МА так и в CRM', to_test: false).save

Tag.new(tag: 'product').save
Tag.new(tag: 'order').save

CheckItemTag.new(check_item_id: 1, tag_id: 2).save
CheckItemTag.new(check_item_id: 2, tag_id: 2).save
CheckItemTag.new(check_item_id: 3, tag_id: 2).save
CheckItemTag.new(check_item_id: 3, tag_id: 1).save
CheckItemTag.new(check_item_id: 4, tag_id: 1).save

