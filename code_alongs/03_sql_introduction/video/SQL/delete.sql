/* want to delete bad jokes
with rating lesser than 5
to make sure which to delete 
do a select first to dubble 
check the rows*/
SELECT
    *
FROM
    funny_jokes
WHERE
    rating < 5;

DELETE FROM funny_jokes
WHERE
    rating < 5;