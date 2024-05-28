class AccomodationsController < ApplicationController
  def index
    @accomodation = Accomodation.all
  end

end
