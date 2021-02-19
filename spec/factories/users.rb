FactoryBot.define do
  factory :user do
    # ①カラムを全て用意する
    # カラムはSQLで確認する
    nickname              {'test'}
    email                 {'test@example'}
    password              {'0abcde'}
    password_confirmation {password}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_name_kana       {'タナカ'}
    last_name_kana        {'タロウ'}
    birth                 {'1931-02-01'}
  end
end