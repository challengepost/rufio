module EventsHelper
  def customerio_base_url
    'https://app.customer.io'
  end

  def customer_url(customer_id)
    "#{customerio_base_url}/customers/#{customer_id}"
  end

  def campaign_url(campaign_id)
    "#{customerio_base_url}/transactionals/#{campaign_id}"
  end

  def time_ago(event)
    "#{time_ago_in_words Time.at(event.timestamp.to_i)} ago"
  end
end
