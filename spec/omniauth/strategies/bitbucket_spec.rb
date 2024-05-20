require 'spec_helper'

describe OmniAuth::Strategies::Bitbucket do
  context "email" do
    let(:email) { "#{("a".."z").to_a.sample(6).join}@example.com" }
    let(:strategy) { OmniAuth::Strategies::Bitbucket.new nil }
    
    it 'should fall back to non-primary' do
      allow(strategy).to receive_message_chain(:access_token, :get) do |url|
        body = url =~ /emails$/ ? %{{"pagelen": 10, "values": [{"is_primary": true, "is_confirmed": true, "type": "email", "email": "#{email}", "links": {"self": {"href": "https://bitbucket.org/!api/2.0/user/emails/#{email}"}}}], "page": 1, "size": 1}} : '{"user": {}}'
        double body: body
      end
      expect(strategy.raw_info['email']).to eq(email)
    end
  
    it "should prefer primary" do
      allow(strategy).to receive_message_chain(:access_token, :get) do |url|
        body = url =~ /emails$/ ? %{{"pagelen": 10, "values": [{"is_primary": true, "is_confirmed": true, "type": "email", "email": "#{email}", "links": {"self": {"href": "https://bitbucket.org/!api/2.0/user/emails/#{email}"}}}], "page": 1, "size": 1}} : '{"user": {}}'
        double body: body
      end
      expect(strategy.raw_info['email']).to eq(email)
    end
    
    it "should ignore non-existing" do
      allow(strategy).to receive_message_chain(:access_token, :get) do |url|
        body = url =~ /emails$/ ? %{{"pagelen": 0, "values": []}} : '{"user": {}}'
        double body: body
      end
      expect(strategy.raw_info['email']).to eq(nil)
    end
  end
end
