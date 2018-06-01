class Api::V1::SchoolsController < Api::ApiController

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENARATING NEXT TIME
  api :GET, '/v1/schools', 'List schools'
  error code: 401
  def index
    render json: {success: true}
  end
  
end
