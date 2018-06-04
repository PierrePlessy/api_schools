class Api::V1::SchoolsController < Api::ApiController

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENARATING NEXT TIME
  api :GET, '/v1/schools', 'List schools'
  error code: 401
  def index
    # render json: {success: true}
    # @message = "hello"
    # raise School.fist.inspect
    @schools = School.filter(params)
  end

  def show
    @school = School.find(params[:id])
  end

  def create
    @school = School.create(school_params)

    if @school.errors.any?
      render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
    else
      render template: 'api/v1/schools/show', status: 201
    end
  end

  private
  def school_params
    params.require(:school).permit(
      :name,
      :address,
      :city,
      :zip_code,
      :latitude,
      :longitude,
      :status,
      :nb_student,
      :openings,
      :phone,
      :email
    )
  end

end
