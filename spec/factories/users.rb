# == Schema Information
#
# Table name: users
#
#  id                        :integer          not null, primary key
#  email                     :string           default(""), not null
#  encrypted_password        :string           default(""), not null
#  reset_password_token      :string
#  reset_password_sent_at    :datetime
#  remember_created_at       :datetime
#  sign_in_count             :integer          default(0), not null
#  current_sign_in_at        :datetime
#  last_sign_in_at           :datetime
#  current_sign_in_ip        :string
#  last_sign_in_ip           :string
#  created_at                :datetime
#  updated_at                :datetime
#  hacker_comment            :string
#  badge_comment             :string
#  photo_file_name           :string
#  photo_content_type        :string
#  photo_file_size           :integer
#  photo_updated_at          :datetime
#  first_name                :string
#  last_name                 :string
#  bepaid_number             :integer
#  monthly_payment_amount    :float            default(0.0)
#  next_month_payment_amount :float
#  next_month                :integer
#  current_debt              :float
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@hackerspace.by" }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    password "123456"
    password_confirmation "123456"
    # confirmed_at Time.now
    sign_in_count 0
    monthly_payment_amount 10

    factory :admin_user do
      after(:create) do |post|
        post.roles << FactoryGirl.create(:admin_role)
      end
    end
  end
end
