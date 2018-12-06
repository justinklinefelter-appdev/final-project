class RacesController < ApplicationController
require 'open-uri'
  def index
    @races = Race.all

    render("race_templates/index.html.erb")
  end

  def show
    @race = Race.find(params.fetch("id_to_display"))
    sanitized_street_address = URI.encode(@race.location)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + sanitized_street_address + "&key=AIzaSyA5qwIlcKjijP_Ptmv46mk4cCjuWhSzS78"
    parsed_data = JSON.parse(open(url).read)
    
    @latitude = parsed_data.dig("results", 0, "geometry", "location", "lat")

    @longitude = parsed_data.dig("results", 0, "geometry", "location", "lng")

    render("race_templates/show.html.erb")
  end

  def new_form
    @race = Race.new

    render("race_templates/new_form.html.erb")
  end

  def create_row
    @race = Race.new

    @race.name = params.fetch("name")
    @race.event_id = params.fetch("event_id")
    @race.location = params.fetch("location")
    @race.link = params.fetch("link")

    if @race.valid?
      @race.save

      redirect_to("/races", :notice => "Race created successfully.")
    else
      render("race_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @race = Race.find(params.fetch("prefill_with_id"))

    render("race_templates/edit_form.html.erb")
  end

  def update_row
    @race = Race.find(params.fetch("id_to_modify"))

    @race.name = params.fetch("name")
    @race.event_id = params.fetch("event_id")
    @race.location = params.fetch("location")
    @race.link = params.fetch("link")
    if @race.valid?
      @race.save

      redirect_to("/races/#{@race.id}", :notice => "Race updated successfully.")
    else
      render("race_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @race = Race.find(params.fetch("id_to_remove"))

    @race.destroy

    redirect_to("/races", :notice => "Race deleted successfully.")
  end
end
