final recipe1 = {
  'buyUrl': 'http://recipe1.com',
  'description': 'Supert tasty recipe for your pet #1',
  'ingredients': 'Chicken, Salt, Pepper',
  'productName': 'Recipe#1',
  'productId': 'Recipe#1',
  'mainImage': {'full': 'recipe_1.png'},
  'backImage': {'full': 'back_image_recipe_1.png'}
};
final recipe2 = {
  'buyUrl': 'http://recipe2.com',
  'description': 'Supert tasty recipe for your pet #2',
  'ingredients': 'Fish, Salt, Pepper',
  'productName': 'Recipe#2',
  'productId': 'Recipe#2',
  'mainImage': {'full': 'recipe_2.png'},
  'backImage': {'full': 'back_image_recipe_2.png'}
};
final treat1 = {
  'buyUrl': 'http://treat1.com',
  'description': 'Supert tasty treat for your pet #1',
  'ingredients': 'Void, Salt, Pepper',
  'productName': 'Treat#1',
  'productId': 'Treat#1',
  'mainImage': {'full': 'treat_1.png'},
  'backImage': {'full': 'back_image_treat_1.png'}
};
final treat2 = {
  'buyUrl': 'http://treat2.com',
  'description': 'Supert tasty treat for your pet #2',
  'ingredients': 'Black matter, Salt, Pepper',
  'productName': 'Treat#2',
  'productId': 'Treat#2',
  'mainImage': {'full': 'treat_2.png'},
  'backImage': {'full': 'back_image_treat_2.png'}
};
final treat3 = {
  'buyUrl': 'http://treat3.com',
  'description': 'Supert tasty treat for your pet #3',
  'ingredients': 'Black matter, Salt, Pepper',
  'productName': 'Treat#3',
  'productId': 'Treat#3',
  'mainImage': {'full': 'treat_3.png'},
  'backImage': {'full': 'back_image_treat_3.png'}
};

final recommendation1 = {
  'recipe': recipe1,
  'treats': [
    {'treat': treat1},
    {'treat': treat2}
  ]
};
final recommendation2 = {
  'recipe': recipe2,
  'treats': [
    {'treat': treat1},
    {'treat': treat2}
  ]
};
final recommendation3 = {
  'recipe': recipe1,
  'treats': [
    {'treat': treat1},
    {'treat': treat3}
  ]
};

final nutribotConsultations1 = {
  'createdAt': '2020-08-10T12:08:59.255Z',
  'pet': {'id': 1, 'name': 'Lucy'},
  'foodRecommendations': [
    {'foodRecommendation': recommendation1},
    {'foodRecommendation': recommendation2},
  ]
};

final nutribotConsultations2 = {
  'createdAt': '2020-08-10T12:08:59.758Z',
  'pet': {'id': 2, 'name': 'Rocky'},
  'foodRecommendations': [
    {'foodRecommendation': recommendation1},
    {'foodRecommendation': recommendation3},
  ]
};

final nutribotConsultationsResponseBody = {
  'nutribotConsultations': [nutribotConsultations1, nutribotConsultations2]
};
