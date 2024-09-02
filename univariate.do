* Step 1: Load the dataset
use your_dataset, clear

* Step 2: Ensure the dataset contains the necessary variables
* Assume the dataset has the following variables:
* - firm_id: firm identifier
* - date: date of observation
* - emissions: firm's emissions
* - total_assets: firm's total assets (AT)
* - ret: stock return
* - industry: Fama-French (1997) industry code

* Step 3: Generate scaled emissions by total assets
gen scaled_emissions = emissions / total_assets

* Step 4: Keep only firms with positive scaled emissions
keep if scaled_emissions > 0

* Step 5: Extract year and month from the date variable
gen year = year(Date)
gen month = month(Date)

* Step 6: Select only June data for each year for portfolio formation
keep if month == 6

* Step 7: Create industry-specific breakpoints for each June
egen industry_year = group(ff_49 year)

bysort industry_year (scaled_emissions): gen quintile = .

* Calculate the quintiles manually
gen n = _N
gen rank = _n

* Loop over each industry_year and assign quintiles
levelsof industry_year, local(ind_years)
foreach iy in `ind_years' {
    quietly sum n if industry_year == `iy'
    local total = r(sum)
    
    quietly replace quintile = 1 if industry_year == `iy' & rank <= `total'/5
    quietly replace quintile = 2 if industry_year == `iy' & rank > `total'/5 & rank <= 2*`total'/5
    quietly replace quintile = 3 if industry_year == `iy' & rank > 2*`total'/5 & rank <= 3*`total'/5
    quietly replace quintile = 4 if industry_year == `iy' & rank > 3*`total'/5 & rank <= 4*`total'/5
    quietly replace quintile = 5 if industry_year == `iy' & rank > 4*`total'/5
}

* Step 9: Merge June portfolio assignment back with the original dataset to calculate post-formation returns
merge 1:m ISIN using data3.dta, keep(master match) nogen

* Step 10: Calculate the post-formation average stock return for each portfolio
by portfolio: egen avg_return = mean(ret)

* Step 11: Output the results
sort portfolio
list portfolio avg_return, noobs

* Additional: Save the results for further analysis or reporting
save quintile_portfolio_returns.dta, replace