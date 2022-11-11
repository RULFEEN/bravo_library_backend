class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project now!" }.to_json
  end

  #authors
  get "/authors" do
    Author.all.to_json(include: :books)
  end

  post "/authors" do
    author = Author.new(params)

    if author.save
      author.to_json
    else
      halt 422
    end
  end

  patch '/authors/:id' do
    author = Author.find(params[:id])
    author.update(
      genre: params[:genre].length > 0 ? params[:genre] : author[:genre],
      image_url: params[:image_url].length > 10 ? params[:image_url] : author[:image_url]
    )
    author.to_json
  end

  delete "/authors/:id" do
    author = Author.where(id: params['id']).first

    if author.destroy
      {condition: "Deleted"}.to_json
    else
      halt 500
    end
  end

  #books
  get "/books" do
    Book.all.to_json
  end

  post "/books" do
    book = Book.new(params)

    if book.save
      book.to_json
    else
      halt 422
    end
  end

  patch '/books/:id' do
    book = Book.find(params[:id])
    book.update(
      author_id: params[:author_id].to_s.split("").size > 0 ? params[:author_id] : book[:author_id],
      price: params[:price].to_s.split("").size-1 > 2 ? params[:price] : book[:price],
      stock: params[:stock].to_s.split("").size >= 0 ? params[:stock] : book[:stock],
      image_url: params[:image_url].length > 10 ? params[:image_url] : book[:image_url]
    )
    book.to_json
  end

  delete "/books/:id" do
    book = Book.where(id: params['id']).first

    if book.destroy
      {condition: "Deleted"}.to_json
    else
      halt 500
    end
  end

  #readers
  get "/readers" do
    Reader.all.to_json
  end

  post "/readers" do
    reader = Reader.new(params)

    if reader.save
      reader.to_json
    else
      halt 422
    end
  end

  patch '/readers/:id' do
    reader = Reader.find(params[:id])
    reader.update(
      username: params[:username].length > 2 ? params[:username] : reader[:username],
      password: params[:password].length >= 8 ? params[:password] : reader[:password],
      image_url: params[:image_url].length > 10 ? params[:image_url] : reader[:image_url]
    )
    reader.to_json
  end

  delete "/readers/:id" do
    reader = Reader.where(id: params['id']).first

    if reader.destroy
      {condition: "Deleted"}.to_json
    else
      halt 500
    end
  end

end
