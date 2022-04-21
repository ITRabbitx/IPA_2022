/* 
DROP DATABASE IF EXISTS recipes;
CREATE DATABASE recipes;
USE recipes;
*/

DROP TABLE IF EXISTS recipes;
CREATE TABLE recipes(
r_id INT NOT NULL PRIMARY KEY,
r_name varchar(120),
r_instructions varchar(40000),
r_type varchar(20), 
r_duration INT NOT NULL /* in Minutes */
);


DROP TABLE IF EXISTS ingredients;
CREATE TABLE ingredients(
i_id INT NOT NULL PRIMARY KEY,
i_name varchar(80)
);

DROP TABLE IF EXISTS recipes_ingredients;
CREATE TABLE recipes_ingredients(
r_id INT NOT NULL,
i_id INT NOT NULL, 
i_amount INT, /* is milli, 1/1000th of unit */
i_amount_unit CHAR, /* "g" for weight or "L" for volume */
FOREIGN KEY (i_id) REFERENCES ingredients(i_id), 
FOREIGN KEY (r_id) REFERENCES recipes(r_id) 
);


INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (1, "Chicken curry with vegetables", 
"1. Cube the chickenbreast into even cubes. 
2. Heat the frying pan to medium, and add the sesame oil.
3. Cook the chicken until browned on the outside.
4. Remove from the heat.
5. Add the chicken and the vegetables to a pot.
6. Add the coconut milk, stir and bring to simmer.
7. Add the curry paste.
8. Cook until the chicken is cooked through, around 15 minutes.
9. Meanwhile measure the rice and cook according to package instructions.
10. Keep the curry warm on a low heat, while the rice cooks.
11. Serve", "main", 45 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (2, "Lentil dal", "
1. Cook the onions in the oil until soft
2. Add the garlic and ginger and saute for a minute.
3. Add the spices and stir for a few seconds.
4. Rince the lentils under cold water, then add them to the pot.
5. Add the vegetable broth to the lentils and onion mix, and pour in the vegetable broth.
6. Cook them covered for 8-10 minutes.
7. Add the coconut milk and tomatoes. 
8. Cook rice according to package instructions, or serve with Naan instead.", "main", 30 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (3, "Mashed potatoes", "
1. Peel and cube the potatoes.
2. Add to pot a cold water and bring to a boil.
3. Cook the potatoes until soft.
4. Gently heat the milk and butter until warm.
5. Drain the potatoes and mash with fork.
6. Add the butter, milk, nutmeg, salt and pepper to the potatoes.
7. Combine and taste for seasoning.
8. Serve.", "side", 50 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (5, "Brownies", "
1. Preheat oven to 175 degrees celcius.
2. Line the pan with parchment paper
3. Melt the butter, and once melted, add the chocolate.
4. Stir until the chocolate is melted.
5. Whisk the eggs in a large bowl. Add the salt, sugar, brown sugar and vanilla.
6. Whisk until smooth, then add the chocolate-butter mixture.
7. Add the flour, combine well and pour into the pan.
8. Spread evenly and bake for 45 minutes. 
9. Let cool completly, remove and cut to serve.",
"dessert", 30 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (6, "Baked brie in puff pastry", "
1. Roll out the pastry sheet. 2. Preheat the oven to 220 degrees celcius. 
3. Cut out circles from the dough. 4. Chop the cherries, pecans and rosemary. 
5. Place the cut out pieces on a parchment paper lined baking sheet. 
6. Place the sliced piece of brie on the dough. 
7. Drizzle with honey and cover it with the dried cherries, pecans and rosemary. 
8. Brush the eggs with the egg mixture. 
9. Cover the cheese with another sheet of puff pastry, to make it extra secure. 
10. Bake the cheese for 20 minutes, then remove, let cool and serve.",
"starter", 30 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (7, "Zucchini fritters with feta and dill",
"1. Shred the zucchini using a grater or a food processor. 
2. Transfer the zucchini to a fine mesh strainer and set over a bowl. 
3. Toss the zucchini with the salt and let it sit for 10 minutes. 
4. Wring all of the excess liquid out of the zucchini, then set aside. 
5. Beat the eggs in a large bowl. 5. Mix in the dried zucchini, scallions, dill, feta, garlic and black pepper. 
6. Sprinkle the flour (or corn starch) and baking powder over mixture and stir until uniformly incorporated. 
7. Heat some olive oil in a large non-stick skillet over medium heat. 
8. Drop 2-tablespoon sized portions into the pan, then use the back of a spoon to gently press the batter into 5 cm-wide fritters. 
9. Pan-fry until golden brown on both sides, 2-3 minutes per side. 
10. Transfer the fritters to a paper towel-lined plate. 
11. Repeat until there is no batter left. 
12. Serve warm or room temperature.",
"starter", 45 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (8, "Thai crunch salad with peanut dressing",
"1. Combine all the ingredients for the dressing(up until and including the pepper flakes) in a blender. 
2. Process until smooth. 
3. Add the cilantro and blend for a few seconds, until it is finely chopped. 
4. Refigerate. 
5. Combine all the salad ingredients in a bowl, and toss to combine. 
6. If serving immediatly, add the dressing on top and toss. 
7. Otherwise, leave the dressing on the side.",
"starter", 30 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (9, "Orecciette with sausage and broccoli",
"1. Bring a large pot of salted water to a boil. 
2. Cook the orecciete according to package instructions. 
3. In a large skillet, heat the olive oil over medium heat. 
4. Crumble the sausage into the skillet and cook, breaking apart with a spoon until lightly browned, 5-6 minutes. 
5. Reduce the heat and add the garlic, cooking for an additional minute. 
6. Add the remaining olive oil, chicken broth, broccoli and salt and pepper flakes. 
7. Cook, while stirring frequently until the broccoli is tender, 3-4 minutes. 
8. Stir in the butter until melted. 
9. Simmer and reduce for a few mintues to concentrate the sauce. 
10. Drain the pasta, and place back into the pot. 
11. Add the sausage-broccoli mixture, along with half off the cheese. 
12. Toss to blend, taste for seasoning and serve. 
13. Serve the rest of the cheese separatly.",
"main", 30 );
INSERT INTO recipes(r_id, r_name, r_instructions, r_type, r_duration) VALUES (10, "Curried roasted carrots",
"1. Set the oven to 200 degrees celcius. 
2. Line a baking sheet with aluminium foil. 
3. Toss carrots with olive oil, curry powder and salt on the baking sheet, until evenly coated. 
4. While roasting, stir a few times to prevent burning or sticking. 
5. Roast until tender, 20-30 minutes. 
6. Once roasted, toss the carrots with honey on the sheet. 
7. Taste and season as desired.",
"main", 40 );


INSERT INTO ingredients(i_id, i_name) VALUES(1, "chicken breast");
INSERT INTO ingredients(i_id, i_name) VALUES(2, "frozen thai veggies");
INSERT INTO ingredients(i_id, i_name) VALUES(3, "coconut milk");
INSERT INTO ingredients(i_id, i_name) VALUES(4, "curry paste");
INSERT INTO ingredients(i_id, i_name) VALUES(5, "sesame oil");
INSERT INTO ingredients(i_id, i_name) VALUES(6, "basmati rice");
INSERT INTO ingredients(i_id, i_name) VALUES(7, "red lentils");
INSERT INTO ingredients(i_id, i_name) VALUES(8, "tomato sauce");
INSERT INTO ingredients(i_id, i_name) VALUES(9, "onion");
INSERT INTO ingredients(i_id, i_name) VALUES(10, "garlic");
INSERT INTO ingredients(i_id, i_name) VALUES(11, "tumeric");
INSERT INTO ingredients(i_id, i_name) VALUES(12, "coriander");
INSERT INTO ingredients(i_id, i_name) VALUES(13, "cumin");
INSERT INTO ingredients(i_id, i_name) VALUES(14, "paprika");
INSERT INTO ingredients(i_id, i_name) VALUES(15, "garam marsala");
INSERT INTO ingredients(i_id, i_name) VALUES(16, "vegetable broth");
/* end of recipe 1*/
INSERT INTO ingredients(i_id, i_name) VALUES(17, "russet potatoes");
INSERT INTO ingredients(i_id, i_name) VALUES(18, "milk");
INSERT INTO ingredients(i_id, i_name) VALUES(19, "butter");
INSERT INTO ingredients(i_id, i_name) VALUES(20, "nutmeg");
INSERT INTO ingredients(i_id, i_name) VALUES(21, "salt");
INSERT INTO ingredients(i_id, i_name) VALUES(22, "pepper");
/* end of recipe 3*/
INSERT INTO ingredients(i_id, i_name) VALUES(23, "brussels sprouts");
INSERT INTO ingredients(i_id, i_name) VALUES(24, "olive oil");
INSERT INTO ingredients(i_id, i_name) VALUES(25, "balsamic vinegar");
INSERT INTO ingredients(i_id, i_name) VALUES(26, "honey");
/* start of recipe 5*/ 
INSERT INTO ingredients(i_id, i_name) VALUES(27, "sugar");
INSERT INTO ingredients(i_id, i_name) VALUES(28, "dark sugar");
INSERT INTO ingredients(i_id, i_name) VALUES(29, "vanilla");
INSERT INTO ingredients(i_id, i_name) VALUES(30, "eggs");;
INSERT INTO ingredients(i_id, i_name) VALUES(31, "baking soda");
INSERT INTO ingredients(i_id, i_name) VALUES(32, "flour");
INSERT INTO ingredients(i_id, i_name) VALUES(33, "dark chocolate");
INSERT INTO ingredients(i_id, i_name) VALUES(34, "milk chocolate");
/* end of recipe 5*/ 
INSERT INTO ingredients(i_id, i_name) VALUES(35, "puff pastry");
INSERT INTO ingredients(i_id, i_name) VALUES(36, "dried cherries");
INSERT INTO ingredients(i_id, i_name) VALUES(37, "pecans");
INSERT INTO ingredients(i_id, i_name) VALUES(38, "rosemary");
INSERT INTO ingredients(i_id, i_name) VALUES(39, "brie");
/* end of recipe 6*/ 
INSERT INTO ingredients(i_id, i_name) VALUES(40, "zucchini");
INSERT INTO ingredients(i_id, i_name) VALUES(41, "salt");
INSERT INTO ingredients(i_id, i_name) VALUES(42, "scallions");
INSERT INTO ingredients(i_id, i_name) VALUES(43, "dill");
INSERT INTO ingredients(i_id, i_name) VALUES(44, "feta");
INSERT INTO ingredients(i_id, i_name) VALUES(45, "baking powder");
/* end of recipe 7 */ 
INSERT INTO ingredients(i_id, i_name) VALUES(46, "peanut butter");
INSERT INTO ingredients(i_id, i_name) VALUES(47, "rice vingar");
INSERT INTO ingredients(i_id, i_name) VALUES(48, "lime juice");
INSERT INTO ingredients(i_id, i_name) VALUES(49, "sunflower oil");
INSERT INTO ingredients(i_id, i_name) VALUES(50, "soy sauce");
INSERT INTO ingredients(i_id, i_name) VALUES(51, "ginger");
INSERT INTO ingredients(i_id, i_name) VALUES(52, "red pepper flakes");
INSERT INTO ingredients(i_id, i_name) VALUES(53, "cilantro");
INSERT INTO ingredients(i_id, i_name) VALUES(54, "napa cabbage");
INSERT INTO ingredients(i_id, i_name) VALUES(55, "shredded carrots");
INSERT INTO ingredients(i_id, i_name) VALUES(56, "bell pepper");
INSERT INTO ingredients(i_id, i_name) VALUES(57, "cucumber");
INSERT INTO ingredients(i_id, i_name) VALUES(58, "edamame");
/* end of recipe 8 */
INSERT INTO ingredients(i_id, i_name) VALUES(59, "orecciette");
INSERT INTO ingredients(i_id, i_name) VALUES(60, "italian sausage");
INSERT INTO ingredients(i_id, i_name) VALUES(61, "broccoli florets");
INSERT INTO ingredients(i_id, i_name) VALUES(62, "chicken broth");
INSERT INTO ingredients(i_id, i_name) VALUES(63, "pecorino romano");
/* end of recipe 9 */ 
INSERT INTO ingredients(i_id, i_name) VALUES(64, "carrot");
INSERT INTO ingredients(i_id, i_name) VALUES(65, "curry powder");
/* end of recipe 10*/ 



INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (1, 1, 250000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (1, 2, 250000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (1, 3, 500, 'L');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (1, 4, 7000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (1, 5, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (1, 6, 120000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 7, 5000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 8, 500, 'L');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 3, 500, 'L');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 10, 6000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 11, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 12, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 13, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 14, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 15, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 5, 200, 'L');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (2, 18, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (3, 18, 1000000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (3, 19, 250, 'L');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (3, 20, 100000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (3, 21, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (3, 22, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (3, 23, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (3, 24, 100000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 24, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 22, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 23, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 26, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 27, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 20, 225000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 29, 135000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 30, 160000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 31, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 32, 120000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 22, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 34, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 35, 310000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 36, 170000 , 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (4, 37, 60000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (6, 38, 400000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (6, 27, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (6, 40, 47000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (6, 41, 28000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (6, 42, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (6, 32, 453000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (6, 44, 60000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 44, 454000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 22, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 46, 20000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 47, 4000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 48, 570000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 10, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 23, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 35, 300000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 52, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (7, 25, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 54, 69000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 55, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 56, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 57, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 58, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 27, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 47, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 10, 4000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 62, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 22, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 64, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 65, 2000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 66, 600000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 67, 150000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 68, 100000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 69, 50000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 70, 150000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 46, 50000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (8, 65, 75000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 59, 500000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 25, 5000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 60, 2000000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 10, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 62, 200, 'L');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 61, 200000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 22, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 52, 500, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 20, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (9, 63, 50000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (10, 64, 500000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (10, 25, 3000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (10, 65, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (10, 22, 1000, 'g');
INSERT INTO recipes_ingredients(r_id, i_id, i_amount, i_amount_unit) VALUES (10, 27, 1000, 'g');



SELECT 'Contents of tables' AS 'Terminal Debug Comment';
SELECT * from recipes;
SELECT * from ingredients;
SELECT * from recipes_ingredients;

SELECT 'LEFT JOIN over three tables' AS 'Terminal Debug Comment';
/* JOIN three tables with "*" showing all resulting columns */
/* santity check */
SELECT *
FROM recipes LEFT JOIN recipes_ingredients 
ON recipes.r_id=recipes_ingredients.r_id
LEFT JOIN ingredients
ON recipes_ingredients.i_id=ingredients.i_id;


/* for recipie with name matching "Curried roasted carrots" */
/* checking if matching works */
SELECT recipes.r_id As r_id,  r_name, ingredients.i_id AS i_id, i_name, i_amount, i_amount_unit
FROM recipes LEFT JOIN recipes_ingredients 
ON recipes.r_id=recipes_ingredients.r_id
LEFT JOIN ingredients
ON recipes_ingredients.i_id=ingredients.i_id
WHERE recipes.r_name = "Thai crunch salad with peanut dressing";

/* it's displaying recipie id for each ingredient, so by grouping by id, it shows the COUNT of how many ingredients matched */
/* for checking if ingredients are matched to recipes properly when inserted into database */
SELECT recipes.r_id, COUNT(recipes.r_id)
FROM recipes LEFT JOIN recipes_ingredients 
ON recipes.r_id=recipes_ingredients.r_id
LEFT JOIN ingredients
ON recipes_ingredients.i_id=ingredients.i_id
WHERE i_name IN ("carrot", "olive oil", "curry powder") GROUP BY recipes.r_id
;



