# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

TestCaseTag.create(tag: 'teoden')
TestCaseTag.create(tag: 'boromir')
TestCaseTag.create(tag: 'aragorn')

current = TestCase.create(
  name: 'Будь у вас 10000 воинов, вы не справитесь',
  steps: "Привлечь 9999 воинов => проверить, что не справимся;\nПривлечь 10000 воинов => проверить, что не справимся;\nПривлечь большее количество воинов => проверить, что справимся",
  to_test: false
)
current.test_case_tags << TestCaseTag.find(2)

current = TestCase.create(
  name: 'Шесть тысяч воинов. Меньше половины из того, на что я рассчитывал',
  steps: "Привлечь 6000 воинов => проверить, что меньше половины;\nПривлечь 6002 воина => проверить, что больше половины",
  to_test: false
)
current.test_case_tags << TestCaseTag.find(1)
current.test_case_tags << TestCaseTag.find(3)


current = TestCase.create(
  name: 'Мне нет здесь покоя',
  steps: "Находясь здесь, убедиться, что покоя нет;\nПерейти в другое место, убедиться, что покой есть",
  to_test: false
)
current.test_case_tags << TestCaseTag.find(2)

current = TestCase.create(
  name: 'Вам ли кланяться, друзья мои?',
  steps: "Проверить, что при соблюдении всех условий хоббитам не надо кланяться;",
  to_test: false
)
current.test_case_tags << TestCaseTag.find(3)
