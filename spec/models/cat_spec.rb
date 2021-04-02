require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /cats" do
    it 'gets a list of Cats' do
      Cat.create(name: 'LLCoolJ', age: 8, enjoys: 'singing')

      get '/cats'

     
      cat_response = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat_response.length).to eq 1
      first_cat = cat_response.first
      expect(first_cat['name']).to eq 'LLCoolJ'
      expect(first_cat['age']).to eq 8
      expect(first_cat['enjoys']).to eq 'singing'
    end
  end

  describe "POST /cats" do
    it 'creates a new cat' do
      cat_params = {
        cat: {
          name: 'Angelo',
          age: 20,
          enjoys: 'talking about limo business'
        }
      }

      
      post '/cats', params: cat_params

      

      cat_response = JSON.parse(response.body)
      expect(cat_response['name']).to eq 'Angelo'
      expect(cat_response['age']).to eq 20
      expect(cat_response['enjoys']).to eq 'talking about limo business'
    end

    it 'cannot create a new cat without a name' do
      cat_params = {
        cat: {
          age: 4,
          enjoys: 'eating all day'
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['name']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new cat without a age' do
      cat_params = {
        cat: {
          name: 'Johny',
          enjoys: 'dancing on your face'
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['age']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end

    it 'cannot create a new cat without an enjoys description' do
      cat_params = {
        cat: {
          name: 'Poppy',
          age: 14
        }
      }

      post '/cats', params: cat_params

      error_response = JSON.parse(response.body)
      expect(error_response['enjoys']).to include "can't be blank"
      expect(response).to have_http_status(422)
    end
  end
end

