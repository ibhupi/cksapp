module Api
  class GoogleplaceapiController < ApplicationController

    def hello
      render :json => 'Hello!'
    end
  end
end
