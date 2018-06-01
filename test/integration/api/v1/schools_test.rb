require 'test_helper'

feature "Schools" do

  describe "#index" do
    it "return 401 when user is not authenticated" do
      get api_v1_schools_path

      assert_equal 401, last_response.status
    end

    it "return 401 when auth_token is unknow" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => '12345AZERTY'}

      assert_equal 401, last_response.status
    end

    # focus
    it "return 401 when auth_token is valid" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
    end

  end

end