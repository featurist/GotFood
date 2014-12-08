
class AnnouncementsController < ApplicationController
  protect_from_forgery except: :create
  def create
    p "Announcemtn from " + params["From"]
    twiml = Restaurant.find_by_telephone_number(params["From"]).announce_meal(params["Body"])
    render :xml => twiml
  end
end