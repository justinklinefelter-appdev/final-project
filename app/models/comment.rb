# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  body         :string
#  commentor_id :integer
#  result_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord
    
    belongs_to :commentor, :class_name => "User"
    belongs_to :result
    
end
