# frozen_string_literal: true

require 'uri'

RSpec.describe Opti::OAuth2::Client do
  let(:authorization_endpoint) { 'https://example.com/auth' }
  let(:client_id) { 'opti' }
  subject do
    described_class.new(
      authorization_endpoint: authorization_endpoint,
        client_id: client_id
    )
  end

  context '#authorization_url' do
    let(:redirect_uri) { 'https://placeholder.org?a=b' }
    let(:url) { "#{authorization_endpoint}?response_type=code&client_id=#{client_id}&redirect_uri=#{URI.encode_www_form_component(redirect_uri)}" }

    it 'builds a valid authorization url' do
      expect(subject.authorization_url(redirect_uri: redirect_uri)).to eq url
    end
  end

  context 'grant types' do
    context 'authorization code'
    context 'implicit'
    context 'resource owner password'
    context 'client credentials'
    context 'device code'
    context 'refresh token'
  end
end
