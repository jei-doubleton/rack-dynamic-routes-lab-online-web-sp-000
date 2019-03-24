class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)

      item_name = req.path.split("/items/").last
      
      if Item.find_by_name
        item = Item.find_by_name
        resp.write "#{item.price}"
      else
        resp.write "Sorry we don't have that item"
        resp.status = 400
      end

    else
      resp.write "Error message"
      resp.status = 404
    end

    resp.finish

  end

end
