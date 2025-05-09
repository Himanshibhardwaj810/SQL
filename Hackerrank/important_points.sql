1.) You use a subquery in the FROM clause when:
-You need to perform an intermediate calculation (like months * salary) and treat it as a derived table.
-You want to work with a result set that doesn’t exist in the original table but is calculated from its data.
-This allows you to reference the derived data multiple times in your main query without repeating the calculation.