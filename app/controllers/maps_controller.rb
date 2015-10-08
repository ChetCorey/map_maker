class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy, :state_maps]
  before_action :state_codes, only: :create

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
    # gon.meta_data = @maps.last.meta_data
  end

  # GET /maps/1
  # GET /maps/1.json
  def show
    gon.maping = @map
    vals = @map.meta_data.collect{ |x| x["value"] }.sort.uniq
    # gon.color_spots = [
    #   vals.first,
    #   color_span(vals, 1),
    #   color_span(vals, 2),
    #   color_span(vals, 3),
    #   color_span(vals, 4),
    #   vals.last
    # ]
  end
  #
  # def color_span(value, spot)
  #   value[(value.length * (spot) / 5)]
  # end

  def import
    Map.import(params[:file])
  end

  def state_maps
    gon.maping = @map
  end

  # GET /maps/new
  def new
    @map = Map.new
  end

  # GET /maps/1/edit
  def edit
  end

  # POST /maps
  # POST /maps.json
  def create
    @map = Map.new(map_params)
    @file = @map.meta_data
    @meta_data = []
    fips_to_hc_key
    @map.meta_data = @meta_data
    respond_to do |format|
      if @map.save
        format.html { redirect_to @map, notice: 'Map was successfully created.' }
        format.json { render :show, status: :created, location: @map }
      else
        format.html { render :new }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maps/1
  # PATCH/PUT /maps/1.json
  def update
    respond_to do |format|
      if @map.update(map_params)
        format.html { redirect_to @map, notice: 'Map was successfully updated.' }
        format.json { render :show, status: :ok, location: @map }
      else
        format.html { render :edit }
        format.json { render json: @map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maps/1
  # DELETE /maps/1.json
  def destroy
    @map.destroy
    respond_to do |format|
      format.html { redirect_to maps_url, notice: 'Map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def state_codes
    @state_codes = { "02": "ak", "01": "al", "05": "ar", "60": "as", "04": "az", "06": "ca", "08": "co", "09": "ct", "11": "dc", "10": "de", "12": "fl", "13": "ga", "66": "gu", "15": "hi", "19": "ia", "16": "id", "17": "il", "18": "in", "20": "ks", "21": "ky", "22": "la", "25": "ma", "24": "md", "23": "me", "26": "mi", "27": "mn", "29": "mo", "28": "ms", "30": "mt", "37": "nc", "38": "nd", "31": "ne", "33": "nh", "34": "nj", "35": "nm", "32": "nv", "36": "ny", "39": "oh", "40": "ok", "41": "or", "42": "pa", "72": "pr", "44": "ri", "45": "sc", "46": "sd", "47": "tn", "48": "tx", "49": "ut", "51": "va", "78": "vi", "50": "vt", "53": "wa", "55": "wi", "54": "wv", "56": "wy" }
  end

  def fips_to_hc_key
    CSV.foreach(@file.path, headers: true) do |row|
      value = row["value"]
      fip = row["fips"]

      if fip.length == 5
        county_code = fip.slice!(-3, 3)
        state_code = @state_codes[fip.to_sym]
        @meta_data << {"hc-key":"us-#{state_code}-#{county_code}", "value": value.to_i}
      else  # fip.length == 4
        county_code = fip.slice!(-3, 3)
        state_number = "0#{fip}"
        state_code = @state_codes[state_number.to_sym]
        @meta_data << {"hc-key":"us-#{state_code}-#{county_code}", "value": value.to_i}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:title, :subtitle, :meta_data, :file, :state_maps)
    end
end
