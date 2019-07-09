User.destroy_all
Recipe.destroy_all

# Create User instances:
martin = User.create(
    username: "MDrable0",
    first_name: "Martin",
    last_name: "Drable", 
    password: "12345"
)

kipp = User.create(
    username: "KRudolph",
    first_name: "Kipp",
    last_name: "Rudolph",
    password: "12345"
)

andrew = User.create(
    username: "AHollier",
    first_name: "Andrew",
    last_name: "Hollier",
    password: "12345"
)

baron = User.create(
    username: "BLip",
    first_name: "Baron",
    last_name: "Lip",
    password: "12345"
)

grace = User.create(
    username: "GTan",
    first_name: "Grace",
    last_name: "Tan",
    password: "12345"
)


# Create Recipe instances:
chicken_soup = Recipe.create(
    title: "Chicken soup",
    ingredients: "1 (3 pound) whole chicken4 carrots, 4 stalks celery, halved celery, 1 large onion, salt and pepper, teaspoon chicken bouillon",
    directions: "Put the chicken, carrots, celery and onion in a large soup pot and cover with cold water. Heat and simmer, uncovered, until the chicken meat falls off of the bones.
    Take everything out of the pot. Strain the broth. Pick the meat off of the bones and chop the carrots, celery and onion. Season the broth with salt, pepper and chicken bouillon to taste, if desired. Return the chicken, carrots, celery and onion to the pot, stir together, and serve.",
    calories: 150.0
)

chicken_stew = Recipe.create(
    title: "Chicken stew",
    ingredients: "2 tbsp. butter, 
        2 large carrots,
        1 stalk celery,
        Kosher salt,
        black pepper,
        3 cloves garlic,
        1 tbsp. all-purpose flour,
        1 1/2 lb. chicken breasts,
        3 sprigs fresh thyme,
        1 bay leaf,
        3/4 lb. baby potatoes, quartered,
        3 cups Swanson Chicken Broth,
        Parsley",
    directions: 
        "In a large pot over medium heat, melt butter. Add carrots and celery and season with salt and pepper. Cook, stirring often, until vegetables are tender, about 5 minutes. Add garlic and cook until fragrant, about 30 seconds.
        
        Add flour and stir until vegetables are coated, then add chicken, thyme, bay leaf, potatoes, and broth. Season with salt and pepper. Bring mixture to a simmer and cook until the chicken is no longer pink and potatoes are tender, 15 minutes.
        
        Remove from heat and transfer chicken to a medium bowl. Using two forks, shred chicken into small pieces and return to pot. 
        Garnish with parsley before serving.",
    calories: 160.0
)

parmesan_chicken = Recipe.create(
    title: "Parmesan Chicken",
    ingredients: "4 boneless skinless chicken breasts,
        Kosher salt,
        Freshly ground black pepper,
        3 large eggs, beaten,
        1 c. all-purpose flour,
        2 1/4 c. panko,
        3/4 c. freshly grated Parmesan,
        2 tsp. lemon zest,
        1/2 tsp. cayenne pepper,
        Vegetable oil,
        Lemon wedges, for serving",
    directions: 
        "Using a sharp knife, cut chicken breasts in half widthwise. Lay halves between 2 pieces of plastic wrap and place on a cutting board. Use a meat tenderizer or rolling pin to flatten chicken to ¼” thick. Season chicken on both sides with salt and pepper. 
        
        Place eggs and flour in 2 separate shallow bowls. In a third shallow bowl, combine panko, Parmesan, lemon zest, and cayenne. Season with salt and pepper. 
        
        Working one at a time dip chicken cutlets into flour, then eggs, and then panko mixture, pressing to coat. 
        In a large skillet over medium heat, heat 2 tablespoons oil. 
        
        Add chicken and cook until golden and cooked through, 2 to 3 minutes per side. Work in batches as necessary, adding more oil when needed.",         
    calories: 350.0
)

chicken_pasta_bake = Recipe.create(
    title: "Chicken Pasta Bake",
    ingredients: "chicken, pasta, cheese",
    directions: "Mix it. Bake it",
    calories: 1000.0
)

chicken_and_waffles = Recipe.create(
    title: "Chicken and Waffles",
    ingredients: "Fried chicken, Bisquick",
    directions: "Fry chicken. Make waffles. Place chicken on waffles. Syrup.",
    calories: 4000.0
)

# Create favorite instances:

favorite_one = Favorite.create(
    user_id: 4,
    recipe_id: 5
)

favorite_one = Favorite.create(
    user_id: 5,
    recipe_id: 4
)

favorite_one = Favorite.create(
    user_id: 3,
    recipe_id: 3
)