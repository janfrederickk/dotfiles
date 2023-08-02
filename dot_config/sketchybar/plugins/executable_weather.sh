#!/bin/bash
source "$CONFIG_DIR/icons.sh"

curl "https://api.open-meteo.com/v1/forecast?latitude=48.4738&longitude=7.945&daily=weathercode,temperature_2m_max,temperature_2m_min&current_weather=true&timezone=Europe%2FBerlin&forecast_days=1" > ~/temp/weather.json

dailyweathercode=$( cat ~/temp/weather.json | jq -r '.daily.weathercode[0]')
dailymintemp=$( cat ~/temp/weather.json | jq -r '.daily.temperature_2m_min[0]')
dailymaxtemp=$( cat ~/temp/weather.json | jq -r '.daily.temperature_2m_max[0]')
currenttemperature=$( cat ~/temp/weather.json | jq -r '.current_weather.temperature')
currentweathercode=$( cat ~/temp/weather.json | jq -r '.current_weather.weathercode')

echo "Daily weathercode $dailyweathercode"
echo "Daily min temp $dailymintemp"
echo "Daily max temp $dailymaxtemp"
echo "Current Temp $currenttemperature"
echo "Current weathercode $currentweathercode"

sketchybar -m --set weather_current label="$currenttemperature °C"

sketchybar -m --set weather_current icon=${WEATHER[dailyweathercode]}

sketchybar -m --set weather_daily_top label="H: $dailymaxtemp °C"
sketchybar -m --set weather_daily_bottom label="L: $dailymintemp °C"
