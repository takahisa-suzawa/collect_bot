FactoryGirl.define do
  factory :webhook do
    token "XXXXXXXXXXXXXXXXXX"
    team_id "T0001"
    team_domain "example"
    channel_id "C2147483705"
    channel_name "test"
    timestamp "2017-08-02 11:27:13"
    user_id "U2147483697"
    user_name "Steve"
    text "googlebot: What is the air-speed velocity of an unladen swallow?"
    trigger_word "googlebot:"
  end
end
