# Pewlett Hackard Analysis

## Project Overview
In this project the data analysis department applied our knowledge of DataFrames and tabular data to create entity relationship diagrams, imported data into a database, troublshot common errors, and created queries that used data to answer questions about the upcoming "silver tsunami" about to overtake Pewlett-Hackard.

### Resources
+ Data Source: departments.csv, dept_emp.csv, dept_manager.csv, employees.csv, salaries.csv, titles.csv
+ Software: Postgres, pgAdmin

## Objectives
Pewlett-Hackard management tasked the data analysis team with querying the Pewlett-Hackard database in preparation for the "silver tsunami" about to overtake the company -- the mass retirement of numerous employees, many of whom are in key positions within the company.  So as not to be caught off-guard by mass retirements in the near future, the data analysis department were instructed to create some new tables in the Pewlett-Hackard database to get a better understanding of how many, and in which departments, employees would be retiring soon.

Specifically, the assignment was to prepare the following:
+ The Number of Retiring Employees by Title table
+ The Employees Eligible for the Mentorship Program table
+ A written report of the database analysis

## Summary
### The Number of Retiring Employees by Title table
The first objective was to create a table that reflected the number of retiring employees by title.  The team needed to compensate for the possibility of employees being listed multiple times because of a change in title,  so we used the DISTINCT ON function to ferret out employees who had more than one title in the table.  Once we created a table where each retirement candidate had just one job title, we made a query to count the number of potential retirees by title.  Here is the code and the data:

![image](https://user-images.githubusercontent.com/113741694/216791401-e832f6a7-4d8f-4ab9-9fd5-49aa2e3f142a.png)
![image](https://user-images.githubusercontent.com/113741694/216791413-b3d593c0-8b93-4f59-beb6-d95b308303b5.png)

The data analysis team found that approximately 72,458 employees will be part of the upcoming "silver tsumani".  The company needs a plan in place to train new junior employees and a mentorship program to help mentor senior staff.

### The Employees Eligible for the Mentorship Program table
The second objective was to create for management a list of potential employees who would be a good fit to participate in the mentorship program for new senior staff.  Specifically, the team was tasked to query for current employees born in 1965.  Here is the code and the first 10 rows of data:
![image](https://user-images.githubusercontent.com/113741694/216791635-c31403a8-e735-42c7-bc34-c88b22e97c7f.png)
![image](https://user-images.githubusercontent.com/113741694/216791661-3515faab-64f0-47a2-875d-d7661c9a171b.png)

The team found 1,549 current employees who fit the criteria of mentorship eligibility, which is not enough to fill the upcoming employment void created by the "silver tsunami".  Some suggestions for overcoming the "silver tsunami":
   + Join with an local university or junior college to develop a specific curriculum tied to each position that could be taught to students so they can start  working     at PH directly out of school and would require minimal training. 
   + Market heavily to upcoming graduates at universities and graduate schools about the openings and opportunities at PH.







