class GenerationsController < ApplicationController
    skip_before_action :authenticated
    def index
        @generations = Generation.all
    end
end
