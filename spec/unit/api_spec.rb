require 'spec_helper'

describe 'API' do
  include_context 'api'

  describe "authentication" do
    it "authenticates" do
      pending
      client = Credly::Client.new(:username => 'whatever', :password => 'password')
      client.access_token.should_not be_nil
    end
  end

  describe "configuration" do
    it "badge domain" do
      Credly::Client.any_instance.should_receive(:authenticate)
      expect(Credly::Client.new(:username => 'whatever', :password => 'password').options[:base_domain]).to eq('https://staging.credly.com')
    end

    it "badge domain can be defined" do
      Credly::Client.any_instance.should_receive(:authenticate)
      expect(Credly::Client.new(:username => 'whatever', :password => 'password', :base_domain => 'mymy').options[:base_domain]).to eq('mymy')
    end
  end

  describe 'Badges' do
    it 'list all badges' do
      expect_api_call(:get, 'badges', {})
      client.badges.all
    end

    it 'create a badge' do
      expect_api_call(:post, 'badges', :title => 'my title')
      client.badges.create(:title => 'my title')
    end

    it "update a badge" do
      expect_api_call(:post, 'badges/1', {})
      client.badges.update(1, {})
    end

    it "find a badge" do
      expect_api_call(:get, 'badges/1', {})
      client.badges.find(1, {})
    end

    describe "Categories" do
      it "list categories" do
        expect_api_call(:get, 'badges/categories', {})
        client.badges.categories.all({})
      end
    end
  end

  describe "Member Badges" do
    it "create member badge" do
      expect_api_call(:post, 'member_badges', {})
      client.member_badges.create({})
    end

    it "find a member badge " do
      expect_api_call(:get, 'member_badges/1', {})
      client.member_badges.find(1, {})
    end

    describe "Evidence" do
      it "list all evidence for a member_badge" do
        expect_api_call(:get, 'member_badges/1/evidence', {})
        client.member_badges(1).evidence.all({})
      end
    end
  end

  describe "Members" do
    it "list all members" do
      expect_api_call(:get, 'members', {})
      client.members.all({})
    end

    it "find a member" do
      expect_api_call(:get, 'members/1', {})
      client.members.find(1, {})
    end

    describe "Badges" do
      it "list all badges of a member" do
        expect_api_call(:get, 'members/1/badges', {})
        client.members(1).badges.all({})
      end

      it "list all badges a member has given" do
        expect_api_call(:get, 'members/1/badges/given', {})
        client.members(1).badges.given({})
      end
    end
  end

  describe 'Me' do
    it "me" do
      expect_api_call(:get, 'me', {})
      client.me.profile()
    end
  end

  describe "badge_builder" do
    it "should description" do
      pending
      client.badge_builder.token
    end
  end

end