* Load the necessary data
use your_data_file.dta, clear

* Step 1: Calculate scaled emissions
gen scaled_emissions = Scope1 / TA if TA > 0

* Step 2: Keep firms with positive scaled emissions
keep if scaled_emissions > 0

* Step 3: Create year and month variables for portfolio formation
gen formation_year = year(Date)
gen formation_month = month(Date)

* Step 4: Sort firms into quintiles within each industry using astile
* Install the astile package if you haven't done it yet
ssc install astile, replace

* Step 5: Use astile to create quintile portfolios within each industry
astile quintile = scaled_emissions, by(formation_year ff_49) nq(5)

* Step 6: Assign firms to post-formation year (July to next June)
gen post_formation_year = year
replace post_formation_year = post_formation_year + 1 if formation_month >= 7

* Step 7: Calculate value-weighted monthly returns for each portfolio
* Assume you have 'returns' and 'market_cap' variables
collapse (sum) market_cap (mean) returns, by(formation_year post_formation_year post_formation_month quintile)

* Value-weighted returns calculation
gen vwret = (returns * market_cap) / market_cap

* Step 8: Calculate portfolio metrics using astile
foreach q of numlist 1/5 {
    astile mean_vwret_`q' = vwret if quintile == `q'
    astile sd_vwret_`q' = vwret if quintile == `q', detail
    astile sharpe_vwret_`q' = vwret if quintile == `q'
}

* Step 9: Form the High-Minus-Low (H-L) portfolio
gen hl_portfolio = mean_vwret_5 - mean_vwret_1
astile mean_hl = hl_portfolio
astile sd_hl = hl_portfolio, detail
astile sharpe_hl = hl_portfolio

* Display results
display "High-Low Portfolio: Mean: " mean_hl " Std. Dev: " sd_hl " Sharpe Ratio: " sharpe_hl
