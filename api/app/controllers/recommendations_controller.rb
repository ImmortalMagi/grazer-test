class RecommendationsController < ApplicationController
  def find
    @user = User.find(params[:id])
    @preference = @user.preference

    if @preference != nil then
      # Where statements are translated into "AND" in sql, meaning this has many conditions, but is a single search
      @matches = User.where.not(id: @user["id"])
        .where("age >= ?", @preference.lower_age)
        .where("age <= ?", @preference.upper_age)
        .where("gender = ?", @preference.gender)
        .where("diet_type = ?", @preference.looking_for_diet_type)
        .where("locationX <= ?", @user.locationX + @preference.distance)
        .where("locationX >= ?", @user.locationX - @preference.distance)
        .where("locationY <= ?", @user.locationY + @preference.distance)
        .where("locationY >= ?", @user.locationY - @preference.distance)
        .limit(10)
      render :json => @matches
    else
      render :json => ["No Preferences Set"], :status => 200
    end
  end
end
