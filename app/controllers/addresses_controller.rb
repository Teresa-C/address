class AddressesController < ApplicationController
  def show
    postcode = params[:id]
    if postcode.match(/[A-Za-z][1-9] [1-9][A-Za-z]{2}/)
      @addresses = RestClient.get("https://6kb2p9kgb0.execute-api.eu-west-2.amazonaws.com/production/api/v1/addresses/?postcode=#{postcode}", headers={:Authorization => 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjExNyIsImNvbnN1bWVyTmFtZSI6IkludGVydmlld3MiLCJjb25zdW1lclR5cGUiOiIxIiwibmJmIjoxNjE5Nzc1NTY2LCJleHAiOjE5MzUzMDgzNjYsImlhdCI6MTYxOTc3NTU2Nn0.OIbvEbkNecLDOky7bI_fi1r6yxgLxwcFAvy6hbvKpTY'})
      render json: @addresses
    else
      # render :json => '{foo: "bar"}'
      render :json => {'error' => "not valid postcode"}.to_json
    end
  end

end
