class GenerationsController < ApplicationController
    def index
        @generations = Generation.all
    end
end
