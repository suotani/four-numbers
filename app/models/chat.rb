class Chat < ApplicationRecord

  after_create_commit { ChatBroadcastJob.perform_later self }
end
