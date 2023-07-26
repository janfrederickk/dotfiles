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

case $dailyweathercode in

    0)
    icon_result=$WEATHER_0
    ;;

    1)
    icon_result=$WEATHER_1
    ;;

    2)
    icon_result=$WEATHER_2
    ;;

    3)
    icon_result=$WEATHER_3
    ;;

    45 | 46)
    icon_result=$WEATHER_45
    ;;

    51 | 52 | 53 | 55 | 56 | 57)
    icon_result=$WEATHER_51
    ;;

    61 | 63 | 65)
    icon_result=$WEATHER_61
    ;;

    66 | 67)
    icon_result=$WEATHER_66
    ;;

    71)
    icon_result=$WEATHER_71
    ;;

    72)
    icon_result=$WEATHER_72
    ;;

    73)
    icon_result=$WEATHER_73
    ;;

    77)
    icon_result=$WEATHER_77
    ;;

    80 | 81 | 82)
    icon_result=$WEATHER_80
    ;;

    85 | 86 | 82)
    icon_result=$WEATHER_85
    ;;

    95)
    icon_result=$WEATHER_95
    ;;

    96)
    icon_result=$WEATHER_96
    ;;

    99)
    icon_result=$WEATHER_99
    ;;
esac

sketchybar -m --set weather_current icon=$icon_result

sketchybar -m --set weather_daily_top label="H: $dailymaxtemp °C"
sketchybar -m --set weather_daily_bottom label="L: $dailymintemp °C"
