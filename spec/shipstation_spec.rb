RSpec.describe Shipstation do
  describe '.request' do
    it 'accepts the input as a keyword argument' do
      request = stub_request(:post, /ssapi\.shipstation\.com/).with(
        body: '{"key":"value"}',
        headers: {
          'Authorization'=>'Basic dXNlcm5hbWU6cGFzc3dvcmQ='
        },
      )

      Shipstation.request(
        :post,
        'endpoint',
        username: 'username',
        password: 'password',
        input: { 'key' => 'value' },
      )

      expect(request).to have_been_requested
    end

    it 'accepts the input as the only argument' do
      allow(Shipstation).to receive_messages(username: 'username', password: 'password')
      request = stub_request(:post, /ssapi\.shipstation\.com/).with(
        body: '{"key":"value"}',
        headers: {
          'Authorization'=>'Basic dXNlcm5hbWU6cGFzc3dvcmQ='
        },
      )

      Shipstation.request(
        :post,
        'endpoint',
        { 'key' => 'value' },
      )

      expect(request).to have_been_requested
    end

    it 'accepts an array input as the only argument' do
      allow(Shipstation).to receive_messages(username: 'username', password: 'password')
      request = stub_request(:post, /ssapi\.shipstation\.com/).with(
        body: '[{"key":"value"}]',
        headers: {
          'Authorization'=>'Basic dXNlcm5hbWU6cGFzc3dvcmQ='
        },
      )

      Shipstation.request(
        :post,
        'endpoint',
        [{ 'key' => 'value' }],
      )

      expect(request).to have_been_requested
    end
  end
end
