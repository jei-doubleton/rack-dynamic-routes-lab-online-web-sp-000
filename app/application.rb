class Application

  @@items = Item.all

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      
      item_name = req.path.split("/items/").last

      if @@items.find{|i| i.name == item_name}
        item = @@items.find{|i| i.name == item_name}
        resp.write "#{item.price}"
      else
        resp.write "Sorry we don't have that item"
        resp.status = 400
      end
      
    else
      resp.write "Error message"
      resp.status = 404
    end

  end

end
