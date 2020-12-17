FactoryBot.define do
  factory.user do
    nickname               {"太郎"}
    email                  {"test@test.com"}
    password               {"test12"}
    password_confirmation  {password}
    last_name              {"山田"}
    last_name_kana         {"ヤマダ"}
    first_name             {"太郎"}
    first_name_kana        {"タロウ"}
    birthday               {"1989/8/25"}
  end
end