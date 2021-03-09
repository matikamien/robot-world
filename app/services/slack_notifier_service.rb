require 'rest_client'

class SlackNotifierService

  URL = "https://hooks.slack.com/services/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"

  def notify text
    payload = {"text": text}.to_json
    send_push payload
  end

  def send_push(payload)
    RestClient.post(URL, payload, headers = get_headers)
  end

  def get_headers
    {"Content-Type": "application/json"}
  end

end
