class Api::V1::SchoolsController < Api::ApiController

  api :GET, '/v1/schools', 'List schools'
  param :status, String, :desc => "Must be private or public"
  error code: 401
  def index
    @schools = School.filter(params)
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENARATING NEXT TIME
  api :GET, '/v1/schools/:id', 'Show a school'
  def show
    @school = School.find(params[:id])
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENARATING NEXT TIME
  api :POST, '/v1/schools', 'Create a school'
  error code: 422
  def create
    @school = School.create(school_params)

    if @school.errors.any?
      render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
    else
      render template: 'api/v1/schools/show', status: 201
    end
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENARATING NEXT TIME
  api :PATCH, '/v1/schools/:id', 'Update a school'
  api :PUT, '/v1/schools/:id', 'Update a school'
  def update
    # params.permit!
    @school = School.update(params[:id], school_params)

    if @school.errors.any?
      render json: {success: false, errors: @school.errors.messages}.to_json, status: 422
    else
      render template: 'api/v1/schools/show', status: 200
    end
  end

  # DOC GENERATED AUTOMATICALLY: REMOVE THIS LINE TO PREVENT REGENARATING NEXT TIME
  api :DELETE, '/v1/schools/:id', 'Destroy a school'
  def destroy
    school = School.find_by_id(params[:id])

    if !school.blank? && school.destroy
      render json: {success: true}, status: 200
    else
      render json: {success: false}, status:422
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
