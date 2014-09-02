json.array!(@estados) do |estado|
  json.extract! estado, :id, :nombre
  json.url estado_url(estado, format: :json)
end
