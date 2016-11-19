Rails.application.config.middleware.use OmniAuth::Builder do
  provider :amazon, 'amzn1.application-oa2-client.60980d4de7944da19e1fb41d4cb7faf9', '0d30076cf5d937b31bee00c342f6aeece84642a1623deaffe7727874e9d6552c',
    {
      :scope => 'profile postal_code' # default scope
    }
end