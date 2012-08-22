def given_msisdn
  "447711223344"
end

def given_pin
  "11111111"
end

def given_token
  "thisisamadeuptoken"
end

def given_auth_key
  "thisisamadeupauthkey"
end

def load_creds
  Jetsetmeapi::Config.dev_id = given_dev_id
  Jetsetmeapi::Config.app_id = given_app_id
end

def given_dev_id
  "thisisamadeupdevid"
end

def given_app_id
  "thisisamadeupappid"
end

def auth_url
  "https://api.jetsetme.com/authentication/request_token"
end

def confirm_url
  "https://api.jetsetme.com/authentication/confirm_token"
end

def headers
  {"X-DEVID"=> given_dev_id, "X-APPID"=> given_app_id, "Content-type"=>"application/json"}
end