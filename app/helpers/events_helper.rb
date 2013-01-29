module EventsHelper
  def customerio_base_url
    'https://app.customer.io'
  end

  def customer_url(customer_id)
    "#{customerio_base_url}/customers/#{customer_id}"
  end
end
