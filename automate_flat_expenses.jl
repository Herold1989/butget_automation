# add your working directory
cd("/Users/herold/Library/Mobile Documents/com~apple~CloudDocs/Software_Programming/Julia/budget_automation")
wdir     = pwd()

# add some basic packages
using Dates
using CSV, Tables
using DataFrames
using Plots


# import raw sheet data -> Add your own file here

filename = "wohnung_0822.csv"

# headers, beginning of sheet might be different in your case
raw_data  = DataFrame(CSV.File(wdir*"/"*filename, header = 9, skipto = 10))

# clean data

clean_data = DataFrame(Date = string.(raw_data[!,1]));

# get necessary columns: Auftraggeber, Verwendungszweck und Betrag in my case
header_clean = [names(raw_data)[4], names(raw_data)[5], names(raw_data)[8]]

for (i,j) in enumerate(header_clean)
    clean_data[!,j].= raw_data[!,j];
end

# find regularly expenses

# test = sort(clean_data, ([Symbol(names(raw_data)[4]),Symbol(names(raw_data)[5])]))


# file_path = pwd()
# file_name = "/test_data.csv";

# CSV.write(file_path*file_name,  test, writeheader=false)