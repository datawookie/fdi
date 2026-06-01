# fdi

An R package for calculating the South African **Lowveld Fire Danger Index (FDI)**,
the operational fire danger metric used by the South African Weather Service (SAWS).

The index was originally developed by Michael Laing (Zimbabwe, 1968) [1] and adapted for
South African conditions by Winston Trollope. It is calibrated for Lowveld savanna
and bushveld but is applied nationally by SAWS.

## Installation

```r
# install.packages("remotes")
remotes::install_github("datawookie/fdi")
```

## Usage

```r
library(fdi)

# Hot, dry, windy day — no rain in two weeks
fdi(temperature = 38, humidity = 15, wind = 35, days_rain = 14, rain = 5)
#> 90

# Mild day, rained heavily three days ago
fdi(temperature = 22, humidity = 60, wind = 10, days_rain = 3, rain = 40)
#> 16
```

## Inputs

| Parameter   | Description                    | Units |
|-------------|--------------------------------|-------|
| temperature | Air temperature                | °C    |
| humidity    | Relative humidity              | %     |
| wind        | Wind speed                     | km/h  |
| days_rain   | Days since the last rain event | days  |
| rain        | Amount of the last rain event  | mm    |

## Output

A rounded integer on a scale of 0–100+, grouped into five classes:

| Class          | Range |
|----------------|-------|
| Insignificant  | 0–20  |
| Low            | 21–45 |
| Moderate       | 46–60 |
| High           | 61–75 |
| Extremely High | > 75  |

## Formula

The index follows the structure:

```
FDI = round((BI + WF) × RCF)
```

Later publications (e.g. Gouvas et al.) express BI, WF, and RCF as smooth
polynomials fitted to the original tables. This package implements the
**operational lookup tables** from the LFDI field chart,
as used by SAWS [2].

1. **Burn index (BI)** — derived from temperature and humidity:
   ```
   burn_index = (((T - 3) × 6.7 - (90 - RH) × 2.6) / 2 + (90 - RH) × 2.6) / 3.3
   ```

2. **Wind factor (WF)** — a step lookup on wind speed that adds 0 to +40 to
   the burn index (8 bands, 0–46+ km/h).

3. **Rainfall correction factor (RCF)** — a dampening coefficient (0.0–1.0)
   looked up from a table of 13 rainfall bands × up to 21 days since last rain.
   Saturates to 1.0 (no correction) after 3–21 days depending on rain amount.

## References

[1] Willis, C.K., Trollope, W.S.W., et al. (2001). *A Fire Danger Index System for the
Transvaal Lowveld and Adjoining Escarpment Areas.*

[2] *FDI Rainfall Correction Factor and Wind Factor chart* (operational lookup tables implemented in this package). <http://lfdi.inforest.gr/docs/LFDI%20ChartENG-1.pdf>

[3] Gouvas, M., Iliopoulos, N., Papadopoulos, A. & Dasiou, Z. *The South African Lowveld Fire Danger Index (LFDI) and its application advantages in Greece.* <http://lfdi.inforest.gr/docs/LFDI_Greece_JBE.pdf>
