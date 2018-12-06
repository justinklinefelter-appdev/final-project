# == Schema Information
#
# Table name: results
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  race_id         :integer
#  time            :string
#  overall_place   :string
#  age_group_place :string
#  body            :string
#  link            :string
#  year            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Result < ApplicationRecord
    
    belongs_to :user
    belongs_to :race
    has_many :comments, :dependent => :destroy
    
end
