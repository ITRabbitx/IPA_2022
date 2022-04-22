/*
To run this manual test, against database.
From main project directory:
$ sqlite3 recipes.sqlite3 < tests/database_tests.sql 
*/

/* ".mode box" to make output tables look like :
┌──────────┬───────────────┬────────┐
├──────────┼───────────────┼────────┤
└──────────┴───────────────┴────────┘
 */
.mode box

SELECT 'Test query that lists ingredients' AS 'Test';

SELECT i_amount, i_amount_unit, i_name FROM
recipes_ingredients LEFT JOIN ingredients
ON recipes_ingredients.i_id=ingredients.i_id
WHERE recipes_ingredients.r_id = 1;

/*
should be something like:
┌──────────┬───────────────┬────────┐
│ i_amount │ i_amount_unit │ i_name │
├──────────┼───────────────┼────────┤
│ 21000    │ g             │ mint   │
│ 52000    │ g             │ lemon  │
│ 200      │ L             │ water  │
└──────────┴───────────────┴────────┘
*/

SELECT 'Test of name, type and duration of recipe number 1' AS 'Test';

SELECT r_name, r_instructions, r_type FROM
recipes 
WHERE recipes.r_id = 1;

/*
should be:
┌───────────────────────────────┬──────────────────────────────────────────────────────────────┬────────┐
│            r_name             │                        r_instructions                        │ r_type │
├───────────────────────────────┼──────────────────────────────────────────────────────────────┼────────┤
│ Chicken curry with vegetables │ 1. Cube the chickenbreast into even cubes.                   │ main   │
│                               │ 2. Heat the frying pan to medium, and add the sesame oil.    │        │
│                               │ 3. Cook the chicken until browned on the outside.            │        │
│                               │ 4. Remove from the heat.                                     │        │
│                               │ 5. Add the chicken and the vegetables to a pot.              │        │
│                               │ 6. Add the coconut milk, stir and bring to simmer.           │        │
│                               │ 7. Add the curry paste.                                      │        │
│                               │ 8. Cook until the chicken is cooked through, around 15 minut │        │
│                               │ es.                                                          │        │
│                               │ 9. Meanwhile measure the rice and cook according to package  │        │
│                               │ instructions.                                                │        │
│                               │ 10. Keep the curry warm on a low heat, while the rice cooks. │        │
│                               │ 11. Serve                                                    │        │
└───────────────────────────────┴──────────────────────────────────────────────────────────────┴────────┘
*/

SELECT 'Test query that litsts ingredients of recipe number 1' AS 'Test';

SELECT i_amount, i_amount_unit, i_name FROM
recipes LEFT JOIN recipes_ingredients
ON recipes.r_id=recipes_ingredients.r_id
LEFT JOIN ingredients
ON recipes_ingredients.i_id=ingredients.i_id
WHERE recipes.r_id = 1;

/*
should be something like:
┌──────────┬───────────────┬─────────────────────┐
│ i_amount │ i_amount_unit │       i_name        │
├──────────┼───────────────┼─────────────────────┤
│ 250000   │ g             │ chicken breast      │
│ 250000   │ g             │ frozen thai veggies │
│ 500      │ L             │ coconut milk        │
│ 7000     │ g             │ curry paste         │
│ 2000     │ g             │ sesame oil          │
│ 120000   │ g             │ basmati rice        │
└──────────┴───────────────┴─────────────────────┘
*/
