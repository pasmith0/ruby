require 'accuweather'

location_array = Accuweather.city_search(name: 'vancouver')
vancouver = location_array.first
current_weather = Accuweather.get_conditions(location_id: 'cityId:53286').current
weather_forecast = Accuweather.get_conditions(location_id: 'cityId:53286').forecast
units = Accuweather.get_conditions(location_id: 'cityId:53286').units

