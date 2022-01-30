# format-spectra
Take raw reflectance spectra files ('.JAZ'), extract percent reflectance column, average over single nm from 300-700nm, restructure multiple spectra files into single rectangular matrix ('.csv')

Reflectance spectra are saved by JAZ spectrometers as ‘.jaz’ files. This file type is a simple text file with an 18-line header, a single line footer, and five columns of reflectance data sandwiched in the middle. The first column is the light wavelength in nanometers, column two is the ‘dark standard’, column three is the ‘high reflectance standard’, column four is the ‘target’, and column five is the calculated percent reflectance of the target. We are not really interested in the middle three columns because these counts are somewhat arbitrary and depend on the standards used and the warmth of the lamp during data collection. This is why we are instead interested in the percent reflectance (the far right column), because if the data is collected well these numbers should be repeatable. 

Our goal here is to take the info from the left column and the info from the right column, distill it down to a single value for each whole nanometer measured, and deposit it into a .csv file along with the other .jaz files for use in analyses.
