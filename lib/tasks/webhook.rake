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
      campaign_name:"Submission received to submitter",
      timestamp:"1381425552",
      environment_id:1,
      event_id:"3ded24a44277a26cf2a0",
      event_type:"email_clicked"
    }
  end
end
