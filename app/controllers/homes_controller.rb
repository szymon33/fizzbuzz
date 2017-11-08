class HomesController < ApplicationController
  before_filter :store_page_params, only: :populate
  before_filter :restore_page_params, only: :ilike

  def hundred
    @rows = Fizzbuzz.populate
  end

  def populate
    rows = Fizzbuzz.populate(@total)
    @rows = Kaminari.paginate_array(rows, total_count: rows.length)
                    .page(params[:page])
                    .per(@per_page)
  end

  def ilike
    decision = params['decision'].present? ? params['decision'] : nil
    session[Fizzbuzz.format(key)] = decision
    redirect_to url_for(
      action: 'populate',
      total: @total,
      page: @page,
      perpage: @per_page
    )
  end

  private

  def key
    @key ||= params[:id]
  end

  def store_page_params
    @total = params[:total]
    @page = params[:page]
    @per_page = params[:perpage] || Fizzbuzz::PER_PAGE
    session[:total] = @total
    session[:page] = @page
    session[:per_page] = @per_page
  end

  def restore_page_params
    @total = session[:total]
    @page = session[:page]
    @per_page = session[:per_page]
  end
end
