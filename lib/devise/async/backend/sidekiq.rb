module Devise
  module Async
    module Backend
      class Sidekiq < Base
        include ::Sidekiq::Worker

        sidekiq_options :queue => Devise::Async.queue, :retry => Devise::Async.retry
        def self.enqueue(*args)
          perform_async(*args)
        end
      end
    end
  end
end
