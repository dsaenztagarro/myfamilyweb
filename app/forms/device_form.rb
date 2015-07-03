class DeviceForm
  include ActiveModel::Model
  include Virtus.model

  attribute :name, String, default: ''
  attribute :properties, Array[D

  def initialize(device)
    @device = device
  end

  private

  def persist!
  end
end