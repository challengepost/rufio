class Event < ActiveRecord::Base
  attr_accessible :campaign_id, :campaign_name, :customer_id, :email_address, :email_id, :event_id, :event_type, :subject, :timestamp, :environment_id

  belongs_to :environment

  default_scope order('created_at DESC')

  self.per_page = 100

  EVENT_TYPES = [
    EMAIL_DRAFTED         = 'email_drafted',
    EMAIL_DELIVERED       = 'email_delivered',
    EMAIL_OPENED          = 'email_opened',
    EMAIL_CLICKED         = 'email_clicked',
    EMAIL_BOUNCED         = 'email_bounced',
    EMAIL_SPAMMED         = 'email_spammed',
    EMAIL_DROPPED         = 'email_dropped',
    EMAIL_FAILED          = 'email_failed',
    CUSTOMER_UNSUBSCRIBED = 'customer_unsubscribed',
    CUSTOMER_SUBSCRIBED   = 'customer_subscribed'
  ]

  ERROR_TYPES = [EMAIL_FAILED, EMAIL_DROPPED, EMAIL_BOUNCED, EMAIL_SPAMMED]

  def error?
    ERROR_TYPES.include?(event_type)
  end

  def description
    event_type.try :humanize || "Type unknown"
  end

  def inspect
    "#{description}: #{attributes.inspect}"
  end
end
