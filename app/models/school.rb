class School < ApplicationRecord

  validates :name, presence: true
  # validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}
  before_save :format_lat_lng

  def self.filter(params)
    out = []
    if params[:status].blank?
      out = School.all
    else
      out = where(['status = ?', params[:status]])
    end

    return out.order("name ASC")
  end

  private
  def format_lat_lng
    self.latitude = latitude.to_f
    self.longitude = longitude.to_f
    self.nb_student = nb_student.to_i
  end

end
