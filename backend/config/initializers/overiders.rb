# frozen_string_literal: true

OVERRIDERS_PATH = Rails.root.join('app', 'overriders')
# Create the overriders files once on rails app boot
Rails.application.config.after_initialize do
  files = Dir.glob("#{OVERRIDERS_PATH}/**/*.rb")
  files.each { |f| require f }
end
