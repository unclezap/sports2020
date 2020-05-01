class BatchesController < ApplicationController

    def index
        batches = current_user.batches
        return_array = []
        batches.each do |batch|
            if batch.article && batch.week_result
                individual_batch_hash = {}
                individual_batch_hash[:week] = batch.week_result.week
                individual_batch_hash[:predictions] = batch.predictions
                individual_batch_hash[:scores] = batch.scores
                individual_batch_hash[:name] = batch.name
                return_array.push(individual_batch_hash)
            end
        end
        render json: return_array
    end

end
