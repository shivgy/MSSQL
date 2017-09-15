# Hackerrank Advanced SQL Problem
Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

Note: Print NULL when there are no more names corresponding to an occupation.

## Input Format
The **OCCUPATIONS** table is described as follows:
```
-------------------------
| Column     | Type     |
| ----------------------|
| Name       | String   |
| Occupation | String   |
-------------------------
```
## Sample Input
```
-------------------------
| Name      | Occupation|
| ----------------------|
| Samantha  | Doctor    |
| Julia     | Actor     |
| Maria     | Actor     |
| Meera     | Singer    |
| Ashely    | Professor |
| Ketty     | Professor |
| Christeen | Professor |
| Jane      | Actor     |
| Jenny     | Doctor    |
| Priya     | Singer    |
| Angelina  | Singer    |
| Sarah     | Singer    |
| Rashmi    | Doctor    |
| Avni      | Doctor    |
| Harshita  | Actor     |
| Neha      | Actor     |
-------------------------
```
## Sample Output
```
-------------------------------------------------
| Avni      | Ashely    | Meera   | Harshita  |
| Jenny     | Christeen | Priya   | Jane      |
| Rashmi    | Ketty     | Rashmi  | Julia     |
| Sumantha  | NULL      | Sarah   | Maria     |
| NULL      | NULL      | NULL    | Neha      |
-------------------------------------------------
```

## Solution
select * into #emp from occupations;
select Doctor,Professor,Singer,Actor from (select name,occupation,row_number() over(partition by occupation order by name) as rn from #emp)as S pivot(max(name) for occupation in(Doctor,Professor,Singer,Actor)) as pvt;

## Explanation
Syntax of `PIVOT` function:
```
SELECT <non-pivoted column>,
    [first pivoted column] AS <column name>,
    [second pivoted column] AS <column name>,
    [last pivoted column] AS <column name>
FROM
    (<SELECT query that produces the data>)
    AS <alias for the source query>
PIVOT
(
    <aggregation function>(<column being aggregated>)
FOR
[<column that contains the values that will become column headers>]
    IN ( [first pivoted column], [second pivoted column],
    ... [last pivoted column])
) AS <alias for the pivot table>
<optional ORDER BY clause>;
```
