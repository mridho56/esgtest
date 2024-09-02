*** ----------------------------------------------------------------------- ***
***              Load the dataset and create a STATA dataset                ***
*** ----------------------------------------------------------------------- ***

* Here goes your directory
cd "X:\My Documents\Test esg"
 
* clear the dataset previously loaded 
clear
set maxvar 15000

*** ----------------------Import the Enviromental Score--------------------------- ***
** Import the first part
import excel using Test_esg_2.xlsx, sheet("envscore") cellrange(B1:GJJ23) firstrow clear
 
gen Years = _n  

// Identify and convert string variables to numeric
ds SC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SC* {
    recast double `var'
}

// Verify the changes
describe SC*

 
* reshape from wide to long 
reshape long SC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SC_1, replace

** Import the second part
clear
import excel using Test_esg_2.xlsx, sheet("envscore") cellrange(GJK1:NTR23) firstrow clear

gen Years = _n  

// Identify and convert string variables to numeric
ds SC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SC* {
    recast double `var'
}

// Verify the changes
describe SC*

* reshape from wide to long 
reshape long SC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SC_2, replace

** Import the third part
clear
import excel using Test_esg_2.xlsx, sheet("envscore") cellrange(NTS1:UKN23) firstrow clear
 
gen Years = _n  
 
// Identify and convert string variables to numeric
ds SC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SC* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SC_3, replace

** Append the three parts
clear
append using Data_SC_1 Data_SC_2 Data_SC_3
save Data_Environmental, replace

* Save the dataset
save Data_Environmental, replace
*** ----------------------Import the Scope1 --------------------------- ***
** Import the first part
clear
import excel using Test_esg_2.xlsx, sheet("scope1") cellrange(B1:GJJ23) firstrow clear
 
gen Years = _n  

// Identify and convert string variables to numeric
ds SCA*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCA* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCA, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCA_1, replace

** Import the second part
clear
import excel using Test_esg_2.xlsx, sheet("scope1") cellrange(GJK1:NTR23) firstrow clear
 
gen Years = _n 
 
// Identify and convert string variables to numeric
ds SCA*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCA* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCA, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCA_2, replace

** Import the third part
clear
import excel using Test_esg_2.xlsx, sheet("scope1") cellrange(NTS1:UKN23) firstrow clear

gen Years = _n 
 
// Identify and convert string variables to numeric
ds SCA*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCA* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCA, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCA_3, replace

** Append the three parts
clear
append using Data_SCA_1 Data_SCA_2 Data_SCA_3
save Data_Scope1, replace

* Save the dataset
save Data_Scope1, replace

*** ----------------------Import the Scope2 --------------------------- ***
** Import the first part
clear
import excel using Test_esg_2.xlsx, sheet("scope2") cellrange(B1:GJJ23) firstrow clear
 
gen Years = _n  

// Identify and convert string variables to numeric
ds SCB*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCB* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCB, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCB_1, replace

** Import the second part
clear
import excel using Test_esg_2.xlsx, sheet("scope2") cellrange(GJK1:NTR22) firstrow clear
 
gen Years = _n 
 
// Identify and convert string variables to numeric
ds SCB*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCB* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCB, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCB_2, replace

** Import the third part
clear
import excel using Test_esg_2.xlsx, sheet("scope2") cellrange(NTS1:UKN23) firstrow clear

gen Years = _n 
 
// Identify and convert string variables to numeric
ds SCB*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCB* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCB, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCB_3, replace

** Append the three parts
clear
append using Data_SCB_1 Data_SCB_2 Data_SCB_3
save Data_Scope2, replace

* Save the dataset
save Data_Scope2, replace
*** ----------------------Import the Scope3 --------------------------- ***
** Import the first part
clear
import excel using Test_esg_2.xlsx, sheet("scope3") cellrange(B1:GJJ23) firstrow clear
 
gen Years = _n  

// Identify and convert string variables to numeric
ds SCC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCC* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCC_1, replace

** Import the second part
clear
import excel using Test_esg_2.xlsx, sheet("scope3") cellrange(GJK1:NTR23) firstrow clear
 
gen Years = _n 
 
// Identify and convert string variables to numeric
ds SCC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCC* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCC_2, replace

** Import the third part
clear
import excel using Test_esg_2.xlsx, sheet("scope3") cellrange(NTS1:UKN23) firstrow clear

gen Years = _n 
 
// Identify and convert string variables to numeric
ds SCC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist SCC* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long SCC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_SCC_3, replace

** Append the three parts
clear
append using Data_SCC_1 Data_SCC_2 Data_SCC_3
save Data_Scope3, replace

* Save the dataset
save Data_Scope3, replace

*** ----------------------Import the Return Index --------------------------- ***
clear
import excel using Test_esg_2.xlsx, sheet("Return Index") cellrange(B1:GJJ265) firstrow clear
 
gen Months = _n  

// Identify and convert string variables to numeric
ds RI*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all RI variables to double
foreach var of varlist RI* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long RI, i(Months)

rename _j Stock_ID
sort Stock_ID Months

save Data_RI_1, replace

** Import the second part
clear
import excel using Test_esg_2.xlsx, sheet("Return Index") cellrange(GJK1:NTR265) firstrow clear
 
gen Months = _n 
 
// Identify and convert string variables to numeric
ds RI*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist RI* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long RI, i(Months)

rename _j Stock_ID
sort Stock_ID Months

save Data_RI_2, replace

** Import the third part
clear
import excel using Test_esg_2.xlsx, sheet("Return Index") cellrange(NTS1:UKN265) firstrow clear

gen Months = _n 
 
// Identify and convert string variables to numeric
ds RI*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist RI* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long RI, i(Months)

rename _j Stock_ID
sort Stock_ID Months

save Data_RI_3, replace

** Append the three parts
clear
append using Data_RI_1 Data_RI_2 Data_RI_3
save Data_RI, replace

* Save the dataset
save Data_RI, replace
*** ----------------------Import the Market Capitalization --------------------------- ***
clear
import excel using Test_esg_2.xlsx, sheet("Market Capitalization") cellrange(B1:GJJ23) firstrow clear
 
gen Years = _n  

// Identify and convert string variables to numeric
ds MC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist MC* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long MC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_MC_1, replace

** Import the second part
clear
import excel using Test_esg_2.xlsx, sheet("Market Capitalization") cellrange(GJK1:NTR23) firstrow clear
 
gen Years = _n 
 
// Identify and convert string variables to numeric
ds MC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all MC variables to double
foreach var of varlist MC* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long MC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_MC_2, replace

** Import the third part
clear
import excel using Test_esg_2.xlsx, sheet("Market Capitalization") cellrange(NTS1:UKN23) firstrow clear

gen Years = _n 
 
// Identify and convert string variables to numeric
ds MC*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist MC* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long MC, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_MC_3, replace

** Append the three parts
clear
append using Data_MC_1 Data_MC_2 Data_MC_3
save Data_MC, replace

* Save the dataset
save Data_MC, replace

*** ----------------------Import the Total Asset --------------------------- ***
clear
import excel using Test_esg_2.xlsx, sheet("Total Asset") cellrange(B1:GJJ23) firstrow clear
 
gen Years = _n  

// Identify and convert string variables to numeric
ds TA*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist TA* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long TA, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_TA_1, replace

** Import the second part
clear
import excel using Test_esg_2.xlsx, sheet("Total Asset") cellrange(GJK1:NTR23) firstrow clear
 
gen Years = _n 
 
// Identify and convert string variables to numeric
ds TA*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all MC variables to double
foreach var of varlist TA* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long TA, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_TA_2, replace

** Import the third part
clear
import excel using Test_esg_2.xlsx, sheet("Total Asset") cellrange(NTS1:UKN23) firstrow clear

gen Years = _n 
 
// Identify and convert string variables to numeric
ds TA*, has(type string)
foreach var of varlist `r(varlist)' {
    destring `var', replace
}

// Recast all SC variables to double
foreach var of varlist TA* {
    recast double `var'
}
 
* reshape from wide to long 
reshape long TA, i(Years)

rename _j Stock_ID
sort Stock_ID Years

save Data_TA_3, replace

** Append the three parts
clear
append using Data_TA_1 Data_TA_2 Data_TA_3
save Data_TA, replace

* Save the dataset
save Data_TA, replace


** ------------------------------------------------------------------------- **
**                  Ajust yearly data into monthly                           **
** ------------------------------------------------------------------------- **

cd "X:\My Documents\Test esg\Experiment 1"

use "Data_Environmental", clear

xtset Years Stock_ID
expand 12
sort Stock_ID Years

by Stock_ID: gen Months = _n

drop Years

save "Data_Environmental", replace


use "Data_Scope1", clear

xtset Years Stock_ID
expand 12
sort Stock_ID Years

by Stock_ID: gen Months = _n

drop Years

save "Data_Scope1", replace



use "Data_Scope2", clear

xtset Years Stock_ID
expand 12
sort Stock_ID Years

by Stock_ID: gen Months = _n

drop Years

save "Data_Scope2", replace



use "Data_Scope3", clear

xtset Years Stock_ID
expand 12
sort Stock_ID Years

by Stock_ID: gen Months = _n

drop Years

save "Data_Scope3", replace



use "Data_MC", clear

xtset Years Stock_ID
expand 12
sort Stock_ID Years

by Stock_ID: gen Months = _n

drop Years

save "Data_MC", replace



use "Data_TA", clear

xtset Years Stock_ID
expand 12
sort Stock_ID Years

by Stock_ID: gen Months = _n

drop Years

save "Data_TA", replace


*gen R = (RI[_n]-RI[_n-1])/RI[_n-1]



** ------------------------------------------------------------------------- **
**                  Create the Unique Dataset by Merging                     **
** ------------------------------------------------------------------------- **
clear
use Data_RI

merge m:m Stock_ID using Data_Environmental.dta	
keep if _merge == 3
drop _merge

merge m:m Stock_ID using Data_Scope1.dta	
keep if _merge == 3
drop _merge

merge m:m Stock_ID using Data_Scope2.dta	
keep if _merge == 3
drop _merge

merge m:m Stock_ID using Data_Scope3.dta
keep if _merge == 3
drop _merge

merge m:m Stock_ID using Data_TA.dta
keep if _merge == 3
drop _merge

merge m:m Stock_ID using Data_MC.dta
keep if _merge == 3
drop _merge

* Save the dataset
save Data, replace


* I use dataset 2 which contains ISIN SIC code name and etc, then i run
// merge m:m ISIN using "Data.dta" //data.dta is dataset contains months and others variables

*after that I begin to sort based on Stock_ID in order to match with the code.
//sort Stock_ID Months
//order Months ISIN SICIndustryCode CountryofExchange CountryofHeadquarters CompanyCommonName RI Env_Score Scope1 Scope2 Scope3 TA MC


*merge m:m Stock_ID using isin.dta
*order Months ISIN RI Env_Score Scope1 Scope2 Scope3 TA MC
* I have Stock_ID and each stock ID should have 264 months in order to match with the main dataset so,

// expand 264
// by Stock_ID: gen Months = _n
// sort Stock_ID Months

* Load the first dataset (the one with months)
//import delimited "path_to_your_dataset1.csv", delimiter(";") clear
* Alternatively, use -use- command if it's a .dta file
* use "path_to_your_dataset1.dta", clear

* Load the second dataset (the one with ISIN, SIC, and Name)
//import delimited "path_to_your_dataset2.csv", delimiter(";") clear
* Alternatively, use -use- command if it's a .dta file
* use "path_to_your_dataset2.dta", clear

* Save the first dataset to memory
//save "dataset1_temp.dta", replace

* Now open the first dataset again
//use "dataset1_temp.dta", clear
//
* Merge the datasets on ISIN
//merge m:1 ISIN using "path_to_your_dataset2.dta"

* Check the merge result
//tab _merge

* If you no longer need the _merge variable
//drop _merge

* Save the merged dataset
//save "merged_dataset.dta", replace


*destring SICIndustryCode
// rename SICIndustryCode SIC
// ds SC*, has(type string)
//foreach var of varlist `r(varlist)' {
//    destring `var', replace
// }


*** ----------------------------------------------------------------------- ***
***               Construct FF industrial portfolio                       ***
*** ----------------------------------------------------------------------- ***

gen year

*generate scaled_emission 
gen scaled_emissions = Scope1 / TA

* Keep only firms with positive scaled emissions
keep if scaled_emissions > 0

* Generate a September indicator
gen June = Date == *m9

*Generate an empty variable to store the quintile each firm falls into
gen quintile = .

* Loop over each year from 2002 to 2023
forval year = 2002/2023 {
    * Filter data for September of each year
    keep if year == `year' & sept == 1

    * Within each industry, sort firms into quintiles based on scaled emissions
    by ff_49 (scaled_emissions), sort: gen rank = _n
    by ff_49: gen total = _N
    gen quintile_`year' = floor(5*(rank-1)/total) + 1
    
    * Store the quintile back into the main dataset
    sort ISIN date
    merge 1:1 ISIN date using data2, keep(master match)
    replace quintile = quintile_`year' if _merge == 3
    drop _merge
}

* Keep data from October of year t to September of year t+1
keep if month >= 10 | month <= 9

* Drop the September flag variable
drop sept

* Generate monthly value-weighted returns for each quintile
gen weight = MC / sum(MC), by(ISIN)

forval q = 1/5 {
    gen R_q`q' = R * (quintile == `q')
    collapse (sum) R_q`q' [aw=weight], by(date)
}

* Calculate the High-Low portfolio return
gen R_HL = R_q5 - R_q1

* Assume the risk-free rate (Rf) is stored in variable `Rf`
gen excess_R_q1 = R_q1 - Rf
gen excess_R_q2 = R_q2 - Rf
gen excess_R_q3 = R_q3 - Rf
gen excess_R_q4 = R_q4 - Rf
gen excess_R_q5 = R_q5 - Rf
gen excess_R_HL = R_HL - Rf

* Calculate annualized average excess return, standard deviation, and Sharpe ratio
foreach p in 1 2 3 4 5 HL {
    sum excess_R_q`p'
    scalar mean_`p' = r(mean)*12
    scalar sd_`p' = r(sd)*sqrt(12)
    scalar sharpe_`p' = mean_`p'/sd_`p'
    
    * Calculate t-statistic
    scalar tstat_`p' = mean_`p'/(r(sd)/sqrt(r(N)))
}

* Display the results
mat results = (mean_1\mean_2\mean_3\mean_4\mean_5\mean_HL\sd_1\sd_2\sd_3\sd_4\sd_5\sd_HL\sharpe_1\sharpe_2\sharpe_3\sharpe_4\sharpe_5\sharpe_HL\tstat_1\tstat_2\tstat_3\tstat_4\tstat_5\tstat_HL)
mat rownames results = "Mean_Excess_Return Std_Dev Sharpe_Ratio T_Stat"
mat colnames results = "Q1 Q2 Q3 Q4 Q5 HL"
matlist results















*** ----------------------------------------------------------------------- ***
***              Fuzy name matching					                       ***
*** ----------------------------------------------------------------------- ***
* we already have name in tridataset which contains parentconame and we want to match it with dataset from esgtest

* I create datsaset from esg test which only consist of Company name and ISIN so I can merge it with the data in tridataset.

cd "X:\My Documents\Test esg\Branch 5"

*keep ISIN CompanyCommonName


*** ----------------------------------------------------------------------- ***
***               Perform a Panel Regression Analysis                       ***
*** ----------------------------------------------------------------------- ***
clear
set more off

use Data, replace

* Run a Pooled Regression
gen LSC = log(SC)

reg LSC SCA SCB SCC MC TR
reg ROE ESG LTA i.Years
reg ROE ESG LTA i.Years, robust