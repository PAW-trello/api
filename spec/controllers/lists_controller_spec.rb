
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'List API', type: :request do
  let!(:board) {create(:board)}
  let!(:lists) {create_list(:list, 10, board_id: board.id)}
  let(:board_id) {board.id}
  let(:id) {lists.first.id}

  describe 'GET /boards/:board_id/lists' do
    before { get "/boards/#{board_id}/lists" }
    context 'when board exists' do
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
      it 'returns correrct size' do
        expect(json.size).to eq(10)
      end
    end
    context 'when board does not exist' do
      let(:board_id) {0}
      it 'returns 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns correct error message' do
        expect(response.body).to match(/Couldn't find Board/)
      end
    end
  end

  describe 'GET /boards/:board_id/lists/:id' do
    before { get "/boards/#{board_id}/lists/#{id}" }
    context 'list exists' do
      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
      it 'matches id' do
        expect(json['id']).to eq(id)
      end
    end
    context 'list does not exist' do
      let(:id) {0}
      it 'returns 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'POST /boards/:board_id/lists' do
    let(:arguments) { { title: 'test' } }
    context 'params are valid' do
      before { post "/boards/#{board_id}/lists", params: arguments }
      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
    context 'params are not valid' do
      before { post "/boards/#{board_id}/lists", params: {} }
      it 'returns 422' do
        expect(response).to have_http_status(422)
      end
      it 'returns error message' do
        expect(response.body).to match(/Validation failed: Title can't be blank/)
      end
    end
  end

  describe 'PUT /boards/:board_id/lists/:id' do
    let(:arguments) { { title: 'test2' } }
    before { put "/boards/#{board_id}/lists/#{id}", params: arguments }
    context 'params are valid' do
      it 'returns 204' do
        expect(response).to have_http_status(204)
      end
      it 'updates title' do
        new_title = List.find(id).title
        expect(new_title).to match(/test2/)
      end
    end
    context 'cannot find item' do
      let(:id) { 0 }
      it 'returns 404' do
        expect(response).to have_http_status(404)
      end
      it 'returns error message' do
        expect(response.body).to match(/Couldn't find List/)
      end
    end
  end

  describe 'DELETE /boards/:board_id/lists/:id' do
    before { delete "/boards/#{board_id}/lists/#{id}"}
    it 'returns 204' do
      expect(response).to have_http_status(204)
    end
  end

end
