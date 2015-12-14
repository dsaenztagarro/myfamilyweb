class Battery < ActiveRecord::Base
  belongs_to :battery_model
  belongs_to :device
  delegate :name, :size, to: :battery_model, prefix: true
  delegate :name, to: :device, prefix: true, allow_nil: true
end
