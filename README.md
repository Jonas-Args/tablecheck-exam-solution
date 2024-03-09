# API Name: Weather API

## Overview:

This application helps to retrieve weather data from a given city. This also includes integration with OpenTelemetry for application stability monitoring purposes.

## Purpose:

The primary purpose of this application is to provide an API that helps individuals retrieve weather data for a given city.

## Potential Use Cases:

### 1. 3rd Patry API for Developers:

- Developers can consume this API to easily retrieve weather data that they need for their application. This also includes coordinates, temperature, timezone, and the actual weather.

### 2. Weather Enthusiast

- Weather enthusiasts can utilize this application to easily get data that they can store for data analysis or whatever purpose they need in the future.

### 2. Hobbyist

- Hobbyists can benefit from this application because it is a non-paid platform that will help them get up and running with their weather data needs.

## Setup:

The setups steps expect following tools installed on the system.

- Github
- Ruby 3.0.0
- Rails 7.0.8

##### 1. Check out the repository

```bash
git clone git@github.com:organization/project-name.git
```

##### 4. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

With OpenTelemetry tracing in the console
```ruby
env OTEL_TRACES_EXPORTER=console rails server
```

And now you can visit the site with the URL http://localhost:3000

## OpenTelemetry Custom Attributes
| Key   | Description                              
| -------- | ----------------------------------------
| `response_time` | The amount of time to finish a single request. We can use this to get the average response time within a period of time.
| `controller`    | The controller where the request is made. 
| `action`        | The action executed by the request. We can combine this with the controller key to get weather data requests per minute.

## Weather API Endpoints
| Method   | URL                                      | Description                              |
| -------- | ---------------------------------------- | ---------------------------------------- |
| `GET`    | `/api/v1/weather?city=Tokyo`                             | Retrieve current weather from a given city. Sample city here is Tokyo                      |

### Get Weather
> https://localhost:3000/api/v1/weather?city=Tokyo

### Rest API Success Responses

```javascript
    HTTP/1.1 200
    Content-Type: application/json

{
  "coord": {
    "lon": 139.6917,
    "lat": 35.6895
  },
  "weather": [
    {
      "id": 801,
      "main": "Clouds",
      "description": "few clouds",
      "icon": "02n"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 5.15,
    "feels_like": -0.29,
    "temp_min": 4.19,
    "temp_max": 5.91,
    "pressure": 1014,
    "humidity": 36
  },
  "visibility": 10000,
  "wind": {
    "speed": 10.29,
    "deg": 330
  },
  "clouds": {
    "all": 20
  },
  "dt": 1709984134,
  "sys": {
    "type": 2,
    "id": 2001249,
    "country": "JP",
    "sunrise": 1709931642,
    "sunset": 1709973787
  },
  "timezone": 32400,
  "id": 1850144,
  "name": "Tokyo",
  "cod": 200
}
```

### Rest API Error Responses

```javascript
    HTTP/1.1  422
    Content-Type: application/json
 
    {
      "error": "Missing city params"
    }
```

```javascript
    HTTP/1.1  422
    Content-Type: application/json
 
    {
      "error": "Failed to retrieve weather data"
    }
```

## Upcoming Features:
- Historical Weather Data
   - This allows access to historical weather data by passing a time range to the API. This feature can help users with research, trend analysis, and historical weather identification.
- Geolocation and Reverse Geolocation
  - Right now, we only support weather retrieval using city names. In the next version, we will be allowing users to retrieve weather information based on geolocation coordinates.
