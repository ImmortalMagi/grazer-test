class PreferencesController < ApplicationController
  def index
    render :json => Preference.all
  end

  def show
    render :json => Preference.find(params[:id])
  end

  def create
    @Preference = Preference.new(preference_params)
    if @Preference.save
      render :json => @Preference
    else
      render :json => ["Error With Values"], status: :unprocessable_entity
    end
  end

  def update
    @Preference = Preference.find(params[:id])

    if @Preference.update(preference_params)
      render :json => @Preference
    else
      render :json => ["Error With Values"], status: :unprocessable_entity
    end
  end

  def destroy
    @Preference = Preference.find(params[:id])
    @Preference.destroy

    render :json => []
  end

  private
    def preference_params
      pref_params = params.expect(preference: [:user_id, :looking_for_diet_type, :ages, :distance, :gender])
      pref_params["user"] = User.find(pref_params["user_id"])
      pref_params.delete("user_id")
      return pref_params
    end
end
