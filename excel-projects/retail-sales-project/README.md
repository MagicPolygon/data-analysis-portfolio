# Retail Sales Project

## Dataset description

The "retail_sales_dataset" sheet and the "Task 2" sheet are the Excel sheets I used as my datasets.

The retail_sales_dataset sheet of the Excel file is comprised of the following columns:

1. Transaction ID
2. Date
3. Customer ID
4. Gender
5. Age
6. Product Category
7. Quantity
8. Price per Unit

The Task 2 sheet of the Excel file is comprised of the following columns:

1. Student name
2. English mark
3. Mathematics mark
4. Science mark

## Project steps

The below describes the steps I took for this project:

1. For the retail_sales_dataset sheet, I started by making Excel recognise all of the available data as a table.

2. From there, I derived Year, Age Group, and Commission columns from the existing columns. I did this by using the YEAR and IF functions, and by multiplying the Quantity and Price per Unit columns together. This, coupled with the recognition of the table, provides more sorting and filtering options, and it enables the calculation of commission-based values.

3. To be able to browse through records with a priority on age, I sorted the Age column from largest to smallest.

4. Using aggregate functions, I calculated the total commission and the average commission over all transactions.

5. I created a Pivot Table to have a view of the data such that commission was summed into gender rows and product category columns, and it includes grand totals. This result is in the "Sheet 1" sheet.

6. I displayed the sums as a percentage of the grand total and applied conditional formatting to these to highlight the highs and lows.

7. In the table that's in the "Task 2" sheet, I applied sorting and filtering to show the best students in each subject.

8. I then calculated the average mark for all students as well as their highest mark, using AVERAGE and MAX.

9. Next, I used sorting and filtering to find the best student by average, and then the best by highest mark.

10. Finally, I used conditional formatting to identify the highest and lowest average scores.
