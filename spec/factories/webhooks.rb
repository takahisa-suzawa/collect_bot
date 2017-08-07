FactoryGirl.define do
  factory :url_post, class: Webhook do
    token "XXXXXXXXXXXXXXXXXX"
    team_id "T0001"
    team_domain "example"
    channel_id "C2147483705"
    channel_name "test"
    timestamp "2017-08-02 11:27:13"
    user_id "U2147483697"
    user_name "Steve"
    text "@nyan post http://www.itmedia.co.jp/enterprise/articles/1708/07/news068.html"
    trigger_word "@nyan"
  end

  factory :url_help, class: Webhook do
    token "XXXXXXXXXXXXXXXXXX"
    team_id "T0001"
    team_domain "example"
    channel_id "C2147483705"
    channel_name "test"
    timestamp "2017-08-02 11:27:13"
    user_id "U2147483697"
    user_name "Steve"
    text "@nyan help"
    trigger_word "@nyan"
  end
end
