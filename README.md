# README

## CSVImport.rb

Most of the code logic has been put in there because :

- ```CsvImport.import``` method allow us to have only one entry point for CSV import, if we want to use a custom library about csv import there's only this method that have to be changed

- ```CsvImport.update_attribues``` since rules about import are common to all models (updating specified attributes) it allow us to have only one method to manage this rules. Attributes are specified inside the models himself allowing us to extend the number of models to import pretty easily

# Test

- Only ```CsvImport.update_attribues``` has been tested since most of the logic is there. Import have not been tested cause I/O unit test could be tricky depending on the CI used causing false positive

- Only ```Person``` has been used for test because ```Building``` test would have been pretty redundant (I would not have done this the same way in a real context but since it's a test I didn't saw the point of copy paste and re-adapt those test)
