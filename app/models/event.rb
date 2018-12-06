# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  link        :string
#

class Event < ApplicationRecord
    
    has_many :races, :dependent => :destroy

end
