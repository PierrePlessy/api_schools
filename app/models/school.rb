class School < ApplicationRecord

  validates :name, presence: true

  def self.filter(params)
    out = []
    if params[:status].blank?
      out = School.all
    else
      out = where(['status = ?', params[:status]])
    end

    return out.order("name ASC")
  end

end
