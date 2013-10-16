namespace :webhook do

  desc "Test email_delivered webhook POST via localhost"
  task :delivered => :environment do
    conn = Faraday.new(:url => 'http://localhost:3000') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    ENV['TOKEN'] ||= Environment.last.token

    conn.post "/events.json?token=#{ENV['TOKEN']}", {
      event_type:"email_clicked",
      event_id:"3ded24a44277a26cf2a0",
      timestamp:"1381425552",
      event: {
        event_type:"email_clicked",
        event_id:"3ded24a44277a26cf2a0",
        timestamp:"1381425552"
      },
      data: {
        customer_id:"production_288711",
        email_address:"phantom@phantom.im",
        email_id:80646769,
        subject:"Submission received: Rugby Fixtures",
        variables: {
          email_id: 80646769,
          event_id:"85b744e0-12ea-0131-6961-0f5a5490af93",
          customer: {
            id:"production_288711",
            created_at:1337617316,
            deleted:false,
            email:"phantom@phantom.im",
            enabled:true,
            firstname:"Agent_Phantom",
            username:"Agent_Phantom"
          },
          event_name:"submission_received_to_submitter",
          event:{
            challenge_title:"AIG Rugby Innovation Challenge",
            challenge_url:"http://aigrugby.challengepost.com/?utm_campaign=aig-rugby-innovation-challenge_20130523&utm_content=submission_received_to_submitter&utm_medium=email&utm_source=transactional"
          },
          from_address:nil,
          recipient:nil,
          reply_to:nil,
          attachments:nil
        },
        template_id:6767,
        campaign_id:3202,
        campaign_name:"Submission received to submitter"
      }
    }
  end

  task :failed => :environment do
    conn = Faraday.new(:url => 'http://localhost:3000') do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end

    ENV['TOKEN'] ||= Environment.last.token

    conn.post "/events.json?token=#{ENV['TOKEN']}", {
      event_type: "email_failed",
      event_id: "76ced35f23a0bd34f66b",
      timestamp: 1381865234,
      event: {
        event_type: "email_failed",
        event_id: "76ced35f23a0bd34f66b",
        timestamp: 1381865234
      },
      data:  {
        customer_id: "development_33060",
        email_address: "kevin@challengepost.com",
        email_id: 85335844,
        subject: "Your draft of {{event.challenge_title}} has been created",
        variables:  {
          email_id: 85335844,
          event_id: "b76938f0-17fd-0131-7190-43c72a401813",
          customer:  {
            created_at: 1295306767,
            deleted: false,
            email: "kevin@challengepost.com",
            enabled: true,
            firstname: "Kevinlulzzaa",
            id: "development_33060"
          }
        },
        template_id: 3962,
        campaign_id: 1588,
        campaign_name: "New draft challenge to creator"
      }
    }
  end
end
