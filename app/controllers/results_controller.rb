class ResultsController < ApplicationController
  def index
    @results = Result.all
    @users = User.all
    @race = Race.all

    render("result_templates/index.html.erb")
  end

  def show
    @result = Result.find(params.fetch("id_to_display"))
    @users = User.all
    @race = Race.all
    render("result_templates/show.html.erb")
  end

  def new_form
    @result = Result.new

    render("result_templates/new_form.html.erb")
  end

  def create_row
    @result = Result.new

    @result.user_id = params.fetch("user_id")
    @result.race_id = params.fetch("race_id")
    @result.time = params.fetch("time")
    @result.overall_place = params.fetch("overall_place")
    @result.age_group_place = params.fetch("age_group_place")
    @result.body = params.fetch("body")
    @result.link = params.fetch("link")
    @result.year = params.fetch("year")

    if @result.valid?
      @result.save

      redirect_to("/results", :notice => "Result created successfully.")
    else
      render("result_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @result = Result.find(params.fetch("prefill_with_id"))

    render("result_templates/edit_form.html.erb")
  end

  def update_row
    @result = Result.find(params.fetch("id_to_modify"))

    @result.user_id = params.fetch("user_id")
    @result.race_id = params.fetch("race_id")
    @result.time = params.fetch("time")
    @result.overall_place = params.fetch("overall_place")
    @result.age_group_place = params.fetch("age_group_place")
    @result.body = params.fetch("body")
    @result.link = params.fetch("link")
    @result.year = params.fetch("year")

    if @result.valid?
      @result.save

      redirect_to("/results/#{@result.id}", :notice => "Result updated successfully.")
    else
      render("result_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @result = Result.find(params.fetch("id_to_remove"))

    @result.destroy

    redirect_to("/results", :notice => "Result deleted successfully.")
  end
end
