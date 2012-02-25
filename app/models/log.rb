class Log < ActiveRecord::Base
  validates :activity, presence: true

  def self.record(message)
    self.create activity: message
  end
end