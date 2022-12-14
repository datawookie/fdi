#' Calculate the Fire Danger Index (FDI)
#'
#' @param temperature Temperature (°C)
#' @param humidity Humidity (%)
#' @param wind Wind speed (km/h)
#' @param days_rain Days since last rain
#' @param rain Amount of last rain (mm)
#'
#' @return A floating point number.
#' @export
#'
#' @examples
#' fdi(10, 50, 10, 1, 20)
#' fdi(40, 30, 30, 15, 5)
fdi <- function(temperature, humidity, wind, days_rain, rain) {
  # Calculate factors.
  temperature_factor <- (temperature - 3) * 6.7
  humidity_factor <- (90 - humidity) * 2.6

  if (rain <= 0) rain <- 1
  if (days_rain <= 0) days_rain <- 21
  if (wind <= 2) wind <- 3

  burn_factor <- temperature_factor - humidity_factor
  burn_index <- (burn_factor / 2 + humidity_factor) / 3.3

  wind_factor <- wind_factor(wind, burn_index)

  if ((rain > 0) && (rain < 2.7)) {
    if (days_rain == 1) {
      fdi <- wind_factor * 0.7
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.9)
    } else {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 2.7) && (rain < 5.3)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 3) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 5.3) && (rain < 7.7)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 4) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 7.7) && (rain < 10.3)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 5) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 10.3) && (rain < 12.9)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 6) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 12.9) && (rain < 15.4)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.3)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 6) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 15.4) && (rain < 20.6)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.2)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 7) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 8) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 8) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 20.6) && (rain < 25.6)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.2)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 7) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 8) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 8) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 25.6) && (rain < 38.5)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.1)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.3)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 7) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 8) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 9) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 10) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 10) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 38.5) && (rain < 51.2)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.0)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.2)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 7) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 8) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 9) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 10) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 11) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 12) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 12) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 51.2) && (rain < 63.9)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.0)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.2)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.3)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 7) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 8) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 9) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 10) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 11) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 12) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 13) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 14) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 15) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 15) {
      fdi <- (wind_factor * 1)
    }
  } else if ((rain >= 63.9) && (rain < 76.6)) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.0)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.1)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.2)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.3)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 7) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 8) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 9) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 10) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 11) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 12) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 13) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 14) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 15) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 16) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 17) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 18) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 19) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 20) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain > 20) {
      fdi <- (wind_factor * 1)
    }
  } else if (rain >= 76.6) {
    if (days_rain == 1) {
      fdi <- (wind_factor * 0.0)
    } else if (days_rain == 2) {
      fdi <- (wind_factor * 0.0)
    } else if (days_rain == 3) {
      fdi <- (wind_factor * 0.1)
    } else if (days_rain == 4) {
      fdi <- (wind_factor * 0.2)
    } else if (days_rain == 5) {
      fdi <- (wind_factor * 0.4)
    } else if (days_rain == 6) {
      fdi <- (wind_factor * 0.5)
    } else if (days_rain == 7) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 8) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 9) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 10) {
      fdi <- (wind_factor * 0.6)
    } else if (days_rain == 11) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 12) {
      fdi <- (wind_factor * 0.7)
    } else if (days_rain == 13) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 14) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 15) {
      fdi <- (wind_factor * 0.8)
    } else if (days_rain == 16) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 17) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 18) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 19) {
      fdi <- (wind_factor * 0.9)
    } else if (days_rain == 20) {
      fdi <- (wind_factor * 0.9)
    } else {
      (days_rain > 20)
    }
    fdi <- (wind_factor * 1)
  }
  round(fdi)
}
