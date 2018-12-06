# == Schema Information
#
# Table name: races
#
#  id         :integer          not null, primary key
#  name       :string
#  event_id   :integer
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link       :string
#

class Race < ApplicationRecord
    
    belongs_to :event
    has_many :results, :dependent => :destroy
    has_many :users, :through => :results, :source => :user

    
end
