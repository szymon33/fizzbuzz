module API
  class HomesController < ApplicationController
    before_filter :get_key, only: [:ilike, :show]

    def hundred
      @rows = Fizzbuzz.populate
      render json: @rows, status: 200
    end

    def populate
      rows = Fizzbuzz.populate(@total)
      @rows = Kaminari.paginate_array(rows, total_count: rows.length)
                      .page(params[:page])
                      .per(@per_page)
      render json: @rows, status: 200
    end

    def show
      @row = { fizzbuzz: { id: @key, decision: session[Fizzbuzz.format(@key)] } }
      render json: @row, status: 200
    end

    def ilike
      decision = params[:decision].present? ? params[:decision] : nil
      session[Fizzbuzz.format(@key)] = decision
      head :no_content
    end

    private

    def get_key
      @key = params[:id]
    end
  end
end
