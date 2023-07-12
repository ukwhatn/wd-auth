Rails.application.config.session_store :redis_store,
                                       servers: %w(redis://redis:6379/0/session),
                                       expire_in: 90.minutes
