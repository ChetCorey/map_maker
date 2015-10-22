class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy, :states, :us_states, :us_counties]
  before_action :state_codes, only: [:create, :new, :edit]
  before_action :set_gon
  before_action :map_type

  # GET /maps
  # GET /maps.json
  def index
    @maps = Map.all
    # gon.meta_data = @maps.last.meta_data
  end

  # GET /maps/1
  # GET /maps/1.json
  def show

    gon.mapping = @map
    vals = @map.meta_data.collect{ |x| x["value"] }.sort.uniq
    redirect_to "/maps/#{@map.id}/#{map_kind}"

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

  def states
    gon.mapping = @map
    vals = @map.meta_data.collect{ |x| x["value"] }.sort.uniq
  end

  def us_states
    gon.mapping = @map
    vals = @map.meta_data.collect{ |x| x["value"] }.sort.uniq
  end

  def us_counties
    gon.mapping = @map
    vals = @map.meta_data.collect{ |x| x["value"] }.sort.uniq
  end

  # GET /maps/new
  def new
    @maps = Map.all
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
    # binding.pry

    @meta_data = []
    @kind = @map.kind
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
    @file = @map.meta_data
    # binding.pry

    @meta_data = []
    @kind = @map.kind
    fips_to_hc_key
    @map.meta_data = @meta_data

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
    @state_codes_letter_key = {"": "", "al": "01", "ak": "02", "az": "04", "ar": "05", "ca": "06", "co": "08", "ct": "09", "de": "10", "dc": "11", "fl": "12", "ga": "13", "hi": "15", "id": "16", "il": "17", "in": "18", "ia": "19", "ks": "20", "ky": "21", "la": "22", "me": "23", "md": "24", "ma": "25", "mi": "26", "mn": "27", "ms": "28", "mo": "29", "mt": "30", "ne": "31", "nv": "32", "nh": "33", "nj": "34", "nm": "35", "ny": "36", "nc": "37", "nd": "38", "oh": "39", "ok": "40", "or": "41", "pa": "42", "ri": "44", "sc": "45", "sd": "46", "tn": "47", "tx": "48", "ut": "49", "vt": "50", "va": "51", "wa": "53", "wv": "54", "wi": "55", "wy": "56", "as": "60", "gu": "66", "pr": "72", "vi": "78" }
    @state_codes_number_key = {"": "", "01": "al", "02": "ak", "04": "az", "05": "ar", "06": "ca", "08": "co", "09": "ct", "10": "de", "11": "dc", "12": "fl", "13": "ga", "15": "hi", "16": "id", "17": "il", "18": "in", "19": "ia", "20": "ks", "21": "ky", "22": "la", "23": "me", "24": "md", "25": "ma", "26": "mi", "27": "mn", "28": "ms", "29": "mo", "30": "mt", "31": "ne", "32": "nv", "33": "nh", "34": "nj", "35": "nm", "36": "ny", "37": "nc", "38": "nd", "39": "oh", "40": "ok", "41": "or", "42": "pa", "44": "ri", "45": "sc", "46": "sd", "47": "tn", "48": "tx", "49": "ut", "50": "vt", "51": "va", "53": "wa", "54": "wv", "55": "wi", "56": "wy", "60": "as", "66": "gu", "72": "pr", "78": "vi" }
  end

  def fips_to_hc_key
    if @kind == 'County with States'
      CSV.foreach(@file.path, headers: true) do |row|
        value = row["value"]
        fip = row["fips"]
        state_number = "0#{fip}"[-2, 2]
        state_code = @state_codes_number_key[state_number.to_sym]
        @meta_data << {"hc-key":"us-#{state_code}", "value": value.to_i}
      end
    elsif @kind == 'States with Counties'
      CSV.foreach(@file.path, headers: true) do |row|
        value = row["value"]
        fip = row["fips"]
        if fip.length == 5
          county_code = fip.slice!(-3, 3)
          state_code = @state_codes_number_key[fip.to_sym]
          @meta_data << {"hc-key":"us-#{state_code}-#{county_code}", "value": value.to_i}
        else  # fip.length == 4
          county_code = fip.slice!(-3, 3)
          state_number = "0#{fip}"
          state_code = @state_codes_number_key[state_number.to_sym]
          @meta_data << {"hc-key":"us-#{state_code}-#{county_code}", "value": value.to_i}
        end
      end
    elsif @kind == 'County with States with Counties'
      CSV.foreach(@file.path, headers: true) do |row|
        value = row["value"]
        fip = row["fips"]
        if fip.length == 5
          county_code = fip.slice!(-3, 3)
          state_code = @state_codes_number_key[fip.to_sym]
          @meta_data << {"hc-key":"us-#{state_code}-#{county_code}", "value": value.to_i}
        else  # fip.length == 4
          county_code = fip.slice!(-3, 3)
          state_number = "0#{fip}"
          state_code = @state_codes_number_key[state_number.to_sym]
          @meta_data << {"hc-key":"us-#{state_code}-#{county_code}", "value": value.to_i}
        end
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_map
      @map = Map.find(params[:id])
    end

    def map_kind
      if @map.kind == 'County with States'
        return 'us_states'
      elsif @map.kind == 'States with Counties'
        return 'states'
      elsif @map.kind == 'County with States with Counties'
        return 'us_counties'
      end
    end

    def map_type
      @map_type = [ 'County with States', 'States with Counties', 'County with States with Counties']
    end

    def set_gon
      gon.mapping == nil
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def map_params
      params.require(:map).permit(:title, :subtitle, :meta_data, :file, :state, :kind)
    end
end
