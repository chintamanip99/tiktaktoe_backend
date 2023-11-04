Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "890144877969-iafslpqr7djdmj2feedo19ahtfr06uhc.apps.googleusercontent.com", "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"
end