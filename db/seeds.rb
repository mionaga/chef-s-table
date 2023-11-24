# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
   email: 'admin@admin',
   encrypted_password: 'testtest'
)

5.times do |i|
  EndUser.find_or_create_by!(
    family_name: "山田#{i + 1}",
    first_name: "はな",
    nickname: "dish#{i+1}",
    email: "yamada#{i + 1}@yamada",
    password: "password",
    specialty: "フランス料理",
    career_intro: "調理師経歴2年目の新人です",
    bio: "特技：肉の解体処理"
  )
end

5.times do |i|
  EndUser.find_or_create_by!(
    family_name: "川田#{i + 1}",
    first_name: "太郎",
    nickname: "plate#{i+1}",
    email: "kawata#{i + 1}@kawata",
    password: "password",
    specialty: "イタリア料理",
    career_intro: "調理師経歴５年目です",
    bio: "特技：魚捌き"
  )
end

Tag.create!([
    { name: '和食' },
    { name: '洋食' },
    { name: '日本料理'},
    { name: 'フランス料理'},
    { name: 'イタリア料理'},
    { name: '中華料理'},
    { name: 'アジアン'},
    { name: 'エスニック'},
    { name: 'その他'}
    ])


Category.create!([
  { name: '野菜' },
  { name: 'キノコ類' },
  { name: '肉' },
  { name: '魚' },
  { name: '卵' },
  { name: 'パスタ' },
  { name: '麺類' },
  { name: '乳製品' }
  ])


CookingTime.create!([
  { time_in_minuites: '15分' },
  { time_in_minuites: '30分' },
  { time_in_minuites: '45分' },
  { time_in_minuites: '60分' },
  { time_in_minuites: '90分' },
  { time_in_minuites: '90分以上' },
  ])