# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

CheckItem.new(
  case_name: 'Будь у вас 10000 воинов, вы не справитесь',
  test_case: "Привлечь 9999 воинов => проверить, что не справимся;\nПривлечь 10000 воинов => проверить, что не справимся;\nПривлечь большее количество воинов => проверить, что справимся",
  to_test: false
).save
CheckItem.new(
  case_name: 'Шесть тысяч воинов. Меньше половины из того, на что я рассчитывал',
  test_case: "Привлечь 6000 воинов => проверить, что меньше половины;\nПривлечь 6002 воина => проверить, что больше половины",
  to_test: false
).save
CheckItem.new(
  case_name: 'Мне нет здесь покоя',
  test_case: "Находясь здесь, убедиться, что покоя нет;\nПерейти в другое место, убедиться, что покой есть",
  to_test: false
).save
CheckItem.new(
  case_name: 'Вам ли кланяться, друзья мои?',
  test_case: "Проверить, что при соблюдении всех условий хоббитам не надо кланяться;",
  to_test: false
).save

Tag.new(tag: 'teoden').save
Tag.new(tag: 'boromir').save
Tag.new(tag: 'aragorn').save

CheckItemTag.new(check_item_id: 1, tag_id: 2).save
CheckItemTag.new(check_item_id: 2, tag_id: 1).save
CheckItemTag.new(check_item_id: 2, tag_id: 3).save
CheckItemTag.new(check_item_id: 3, tag_id: 2).save
CheckItemTag.new(check_item_id: 4, tag_id: 3).save

