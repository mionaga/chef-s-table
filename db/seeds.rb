# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.find_or_create_by!(email: 'admin@admin') do |admin|
   admin.password = 'testtest'
end   


5.times do |i|
  EndUser.find_or_create_by!(email: "yamada#{i + 1}@yamada") do |end_user|
    end_user.family_name = "山田#{i + 1}"
    end_user.first_name = "はな"
    end_user.nickname = "dish#{i+1}"
    end_user.password = "password"
    end_user.specialty = "フランス料理"
    end_user.career_intro = "調理師経歴2年目の新人です"
    end_user.bio = "特技：肉の解体処理"
  end  
end

5.times do |i|
  EndUser.find_or_create_by!(email: "kawata#{i + 1}@kawata") do |end_user|
    end_user.family_name = "川田#{i + 1}"
    end_user.first_name = "太郎"
    end_user.nickname = "plate#{i+1}"
    end_user.password = "password"
    end_user.specialty = "イタリア料理"
    end_user.career_intro = "調理師経歴2年目の新人です"
    end_user.bio = "特技：肉の解体処理"
  end  
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