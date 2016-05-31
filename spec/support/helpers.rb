def json(body)
  JSON.parse(body, symbolize_names: true)
end

def api_get(path, *args)
  get "http://api.example.com#{path}", *args
end

def api_put(path, *args)
  put "http://api.example.com#{path}", *args
end
