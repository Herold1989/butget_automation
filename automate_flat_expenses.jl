# add your working directory
cd("/Users/herold/Library/Mobile Documents/com~apple~CloudDocs/Software_Programming/Julia/budget_automation")
wdir     = pwd()

# add some basic packages
using Dates
using CSV
using DataFrames
using Plots


# import raw sheet data

filename = "wohnung_0822.csv"

raw_data  = DataFrame(CSV.File(wdir*"/"*filename, header = 9, skipto = 10))

# clean data

clean_data = DataFrame(Date = raw_data[!,1]);

header_clean = [names(raw_data)[4], names(raw_data)[5], names(raw_data)[8]]

for (i,j) in enumerate(header_clean)

    clean_data[!,j].= raw_data[!,j];

end
