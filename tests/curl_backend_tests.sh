#!/bin/bash

echo 'Test: Does `cacao, milk, water` return recipies?'
curl --silent 'http://localhost:8040/?q=cacao%2C+milk%2C+water' | grep 'Recipe ' && echo 'OK' || echo 'FAILURE'

echo 'Test: Does `cacao, milk, water` return 2 recipies?'
result="$(curl --silent 'http://localhost:8040/?q=cacao%2C+milk%2C+water' | grep 'Recipe ' | wc -l )"
if [ "$result" == "2" ]; then echo OK; else echo FAIL; fi

echo 'Test: If chocolade recipie no 3 , has cacao and milk'
curl --silent 'http://localhost:8040/recipe/3'|grep 'milk' && echo 'OK' || echo 'FAILURE'
curl --silent 'http://localhost:8040/recipe/3'|grep 'salt' && echo 'OK' || echo 'FAILURE'

