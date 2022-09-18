wind_factor <- function(wind, burn_index) {
  if ((wind >=0) && (wind < 3)) {
    burn_index + 0
  } else if ((wind >=3) && (wind < 9)) {
    burn_index + 5
  } else if ((wind >=9) && (wind < 17)) {
    burn_index + 10
  } else if ((wind >=17) && (wind < 26)) {
    burn_index + 15
  } else if ((wind >=26) && (wind < 33)) {
    burn_index + 20
  } else if ((wind >=33) && (wind < 37)) {
    burn_index + 25
  } else if ((wind >=37) && (wind < 42)) {
    burn_index + 30
  } else if ((wind >=42) && (wind < 46)) {
    burn_index + 35
  } else {
    burn_index + 40
  }
}
