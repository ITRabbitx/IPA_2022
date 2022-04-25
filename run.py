from flask import Flask, request, send_from_directory
import sqlite3
import json

app = Flask(__name__)

# using `@app.route(</path:path>)` would  be comfortable
# for serving static files, but would lead to calling 
# `send_static_file(path)` with `path` provided by user,
# and this could lead to security issue, by user
# asking for other files on our system.
# That's why as server uses only few files,
# each statically served file is manually listed
# as for this server it's simple and sufficient
# and secure.

@app.route('/logo.svg')
def static_logo_svg(): #THIS ONE DOES NOT WORK FOR SOME REASON!
    return send_from_directory('.', 'logo.svg')

@app.route('/styles/style.css')
def static_style_css(): #THIS ONE DOES NOT WORK FOR SOME REASON!
    return send_from_directory('styles', 'style.css')
    #return app.send_static_file('styles/style.css')

def recipes_header_footer(search_text=''):
    # TODO: add error handing in case open() could not open file
    with open('index.html', 'r') as file_handle:
        recipes_template_content = file_handle.read()
    # reuse from index.html tempalte beginning "header" and bottom "footer"
    # part of file. So we can generate cards later from database.
    recipes_parts = recipes_template_content.split('<!--SEPARATOR_FOR_PYTHON-->')
    recipes_header_str = recipes_parts[0] # first element of list after splitting
    recipes_footer_str = recipes_parts[-1] # last element of list after splitting
    # Make form placeholder work or fill with current search text
    if search_text is None:
        # As search text is empty let's remove `value="{search_text_value}"`
        # to make `placeholder` work
        recipes_header_str = recipes_header_str.replace('value="{search_text_value}"', '')
    else:
        # as there was search, let's fill search bar, but substituting {search_text_value}
        recipes_header_str = recipes_header_str.replace('{search_text_value}', search_text)
    return (recipes_header_str, recipes_footer_str)

@app.route('/')
@app.route('/search')
def index(): # cards view
    args = request.args
    q = args.get('q')
    # TODO: add error handing in case open() could not open file
    (recipes_header_str, recipes_footer_str) = recipes_header_footer(q)

    # TODO: add sanity check if not too many ingredients are searched
    #       to protect against DOS attacks on database
    ingredients=str(q).lower().replace('"','').split(',')
    ingredients=[i.strip() for i in ingredients]
    # question marks for SQL injection resilient parameter substitution
    question_marks_str = ('?,'*len(ingredients))[:-1]

    connection = sqlite3.connect('recipes.sqlite3')
    sql_cursor = connection.cursor()
    # find recipes
    sql_cursor.execute('''SELECT recipes.r_id AS r_id, r_name, COUNT(*) as matched_ingredients FROM
recipes LEFT JOIN recipes_ingredients
ON recipes.r_id=recipes_ingredients.r_id
LEFT JOIN ingredients
ON recipes_ingredients.i_id=ingredients.i_id
WHERE i_name IN ({question_marks})
GROUP BY recipes.r_id, recipes.r_name
ORDER BY matched_ingredients DESC
LIMIT 100
'''.format(question_marks = question_marks_str), ingredients );
    # TODO: consider if 100 is a good limit of matches for security

    recipes_cards_str = ''
    for row in sql_cursor:
        recipe_id_str = str(row[0])
        recipe_name_str = str(row[1])
        recipe_matched_ingredients_no = int(row[2])
        # let's construct new card
        c = '''
        <div class="card" style="margin-right: 1rem;">
            <div class="card-body">
                <h5 class="card-title">Recipe {recipe_name}</h5>
                <p class="card-text">Matched {recipe_matched_no} ingredients</p>
                <a class="btn btn-info btn-lg" href="/recipe/{recipe_id}">Let's cook</a>
            </div>
        </div>
        '''.format(recipe_name = recipe_name_str,
                   recipe_id = recipe_id_str,
                   recipe_matched_no = recipe_matched_ingredients_no)
        recipes_cards_str += c
    connection.close()
    return recipes_header_str + recipes_cards_str + recipes_footer_str

@app.route('/recipe/<recipeid>')
def recipe(recipeid):
    (recipes_header_str, recipes_footer_str) = recipes_header_footer()
    # TODO: add check if recipeid is string containing number, as it may be used to inject malicious data
    
    recipe_str = '<div class="card" style="margin-right: 1rem;"><div class="card-body">'

    connection = sqlite3.connect('recipes.sqlite3')
    recipe_cursor = connection.cursor()
    recipe_cursor.execute('''SELECT r_name, r_instructions, r_type, r_duration FROM 
recipes WHERE r_id = {r_id}'''.format(r_id=recipeid));
    recipe_row = next(recipe_cursor)
    recipe_str += '''
    <h5 class="card-title">Recipe {r_name}</h5>
    <p class="card-text">Duration: {r_duration}min</p>
    <p class="card-text">type: {r_type}</p>
    <p class="card-text">Instructions: {r_instructions}</p>
    '''.format(
        r_name = recipe_row[0],
        r_instructions = recipe_row[1],
        r_type = recipe_row[2],
        r_duration = recipe_row[3]);

    ingredients_cursor = connection.cursor()
    ingredients_cursor.execute('''SELECT i_amount, i_amount_unit, i_name FROM
recipes_ingredients LEFT JOIN ingredients
ON recipes_ingredients.i_id=ingredients.i_id
WHERE recipes_ingredients.r_id = {r_id}
'''.format(r_id = recipeid));
    recipe_str += '<ul>'
    for row in ingredients_cursor:
        # TODO: converting units with SI prefixes, e.g. 1000g => 1kg or 0.12 L => 120 mL
        recipe_str += '<li>{amount} {unit} of {item}</li>'.format(
                amount=row[0]/1000,
                unit=row[1],
                item=row[2])
    recipe_str += '</ul>'
    connection.close()

    recipe_str += '</div></div>'
    return recipes_header_str + recipe_str + recipes_footer_str

@app.route('/about')
def about():
    (recipes_header_str, recipes_footer_str) = recipes_header_footer()
    # TODO: add check if recipeid is string containing number, as it may be used to inject malicious data
    content_str = '''
    <div class="card" style="margin-right: 1rem;">
      <div class="card-body">
        <h5 class="card-title">About us:</h5>
        <p class="card-text">Welcome to my small RecipeSearch Website! As you can probably see, the main goal is to provide you, dear user, with suggestions based on the ingredients you already have at home. I sincerely hope it will be of some use to you.</p>
        <p class="card-text">Please be aware that this website is continuously being improved. Should you have any feature requests, please feel free to contact me and i will take it under consideration.</p>
        <p class="card-text">With kind regards,<br/>RecipeSearch</p>
      </div>
    </div>
    '''
    #recipe_str = '<h4>Recipe no.' + str(recipeid) + '</h4>'
    #recipe_str += '<p>Recipe text...</p>'
    return recipes_header_str + content_str + recipes_footer_str

@app.route('/contact')
def contact():
    (recipes_header_str, recipes_footer_str) = recipes_header_footer()
    # TODO: add check if recipeid is string containing number, as it may be used to inject malicious data
    content_str = '''
    <div class="card" style="margin-right: 1rem;">
      <div class="card-body">
        <h5 class="card-title">Contact us:</h5>
        <p class="card-text">Website: <a href="#">RecipeSearch.ch</a></p>
        <p class="card-text">Email: <a href="#">recipesearch@RecipeSearch.ch</a></p>
      </div>
    </div>
    '''
    #recipe_str = '<h4>Recipe no.' + str(recipeid) + '</h4>'
    #recipe_str += '<p>Recipe text...</p>'
    return recipes_header_str + content_str + recipes_footer_str

@app.route('/ingredients/<recipe_id>')
def ingredient(recipe_id):
    connection = sqlite3.connect('recipes.sqlite3')
    cursor = connection.cursor()
    cursor.execute('''SELECT i_name FROM
            recipes_ingredients JOIN ingredients
            ON  recipes_ingredients.i_id = ingredients.i_id
            WHERE r_id = ?''', recipe_id)
    ingredients = list()
    for row in cursor:
        ingredients.append(str(row[0]))
    return json.dumps(ingredients)

app.run(host='0.0.0.0', port=8040)
