require 'spec_helper'

describe HomesController do
  describe 'GET hundred' do
    before(:each) { get :hundred }

    it 'should be successful' do
      expect(response).to be_success
    end

    it 'renders the hundred template' do
      expect(response).to render_template('hundred')
    end

    it 'assigns all rows to @rows' do
      rows = Fizzbuzz.populate
      expect(rows).to be_any

      expect(assigns(:rows)).to eq(rows)
    end
  end

  describe 'GET populate' do
    it 'should be successful' do
      get :populate
      expect(response).to be_success
    end

    it 'renders the hundred template' do
      get :populate
      expect(response).to render_template('populate')
    end

    it 'assigns rows from first page to @rows' do
      rows = Fizzbuzz.populate(Fizzbuzz::PER_PAGE)
      get :populate
      expect(rows).to be_any

      expect(assigns(:rows)).to eq(rows)
    end

    it 'assigns rows from specific page to @rows' do
      page = 10
      rows = Fizzbuzz.populate(Fizzbuzz::PER_PAGE * page)
      get :populate, page: page

      expect(assigns(:rows)).to eq(rows.last(Fizzbuzz::PER_PAGE))
    end
  end

  describe 'PUT ilike' do
    let(:valid_attributes) { { id: 1, decision: 'on' } }

    it 'assigns @key form params' do
      put :ilike, valid_attributes
      expect(assigns(:key)).to eq '1'
    end

    it 'assigns @total form session' do
      session[:total] = '100'
      put :ilike, valid_attributes
      expect(assigns(:total)).to eq '100'
    end

    it 'assigns @page form session' do
      session[:page] = '5'
      put :ilike, valid_attributes
      expect(assigns(:page)).to eq '5'
    end

    it 'assigns @per_page form session' do
      session[:per_page] = '10'
      put :ilike, valid_attributes
      expect(assigns(:per_page)).to eq '10'
    end

    it 'redirects to populate with page, total and per_page from session' do
      session[:total] = 100
      session[:page] = 5
      session[:per_page] = 10

      put :ilike, valid_attributes
      expect(response).to redirect_to '/populate?page=5&perpage=10&total=100'
    end

    it 'redirects to populate' do
      put :ilike, valid_attributes
      expect(response).to redirect_to :populate
    end

    describe 'user decision' do
      it 'likes Fizzbuzz number' do
        expect do
          put :ilike, valid_attributes
        end.to change {
          session[Fizzbuzz.format(1)]
        }.from(nil).to('on')
      end

      it 'unlikes Fizzbuzz number' do
        name = Fizzbuzz.format(1)
        session[name] = 'on'
        valid_attributes['decision'] = nil
        expect do
          put :ilike, valid_attributes
        end.to change {
          session[name]
        }.from('on').to(nil)
      end
    end
  end
end
