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
    it "return the list of all schools" do
      get api_v1_schools_path, nil, {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 200, last_response.status
      assert_equal 2, json_response['schools'].length
      assert_equal "private school", json_response['schools'].first['name']
    end

    # focus
    it "return only private schools" do
      get api_v1_schools_path,
        {status: 'private'},
        {'HTTP_AUTHORIZATION' => 'valid_token'}

      assert_equal 1, json_response['schools'].length
      assert_equal "private school", json_response['schools'].first['name']
    end
  end

  describe "#create" do
    # focus
    it "return 201 when school is successfully created" do
      assert_difference "School.all.count" do
        post api_v1_schools_path, {school: {
            name: "new school"
          }},
          {'HTTP_AUTHORIZATION' => 'valid_token'}

          assert_equal 201, last_response.status
          assert_equal "new school", json_response['school']['name']
      end
    end

    # focus
    it "doesn't creaet a new school when no name given" do
      assert_no_difference "School.all.count" do
        post api_v1_schools_path, {school: {
            name: ""
          }},
          {'HTTP_AUTHORIZATION' => 'valid_token'}

          assert_equal 422, last_response.status
      end
    end

  end

end
