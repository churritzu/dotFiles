
#!/bin/bash
API_KEY="68778a1bb79902956d75eddba8ad7e90"
CITY="Mexicali,mx"
URL="https://api.openweathermap.org/data/2.5/weather?q=${CITY}&units=metric&appid=${API_KEY}"

weather=$(curl -s $URL)
temp=$(echo $weather | jq '.main.temp')
description=$(echo $weather | jq -r '.weather[0].description')
class="weather"

echo "{\"text\": ${temp}, \"tooltip\": \"${description}\", \"class\": \"${class}\"}"
