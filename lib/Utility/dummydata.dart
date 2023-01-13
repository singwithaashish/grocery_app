const categories = [
  {
    "name": "vegetables",
    "image": "Assets/Images/vegetablesArt.png",
  },
  {
    "name": "Fruits",
    "image": "Assets/Images/fruits.jpg",
  },
  {
    "name": "Meat",
    "image": "Assets/Images/meatArt.png",
  },
  {
    "name": "Fish",
    "image": "Assets/Images/fishArt.png",
  },
  {
    "name": "Dairy",
    "image": "Assets/Images/dairy.jpg",
  },
  {
    "name": "Bakery",
    "image": "Assets/Images/bakery.jpg",
  },
  {
    "name": "Drinks",
    "image": "Assets/Images/drinks.jpg",
  },
  {
    "name": "Snacks",
    "image": "Assets/Images/snacks.jpg",
  },
];

List<Map<String, dynamic>> cartItems = [
  {
    'index': 0,
    'quantity': 1,
  },
  {
    'index': 1,
    'quantity': 5,
  },
  {
    'index': 2,
    'quantity': 1,
  },
  {
    'index': 3,
    'quantity': 1,
  },
  {
    'index': 4,
    'quantity': 1,
  },
];

const deals = [
  {
    "image": "Assets/Images/vegetables.jpg",
    "title": "Get 50% off on vegetables",
    "description": "Get 50% off on vegetables",
  },
  {
    "image": "Assets/Images/deals.jpg",
    "title": "Fresh Fruits for you",
    "description": "Get 20% off on all fruits",
  },
  {
    "image": "Assets/Images/strawberry.jpg",
    "title": "Get 50% off on Strawberries",
    "description": "Get 50% off on Strawberries",
  },
  {
    "image": "Assets/Images/vegetables.jpg",
    "title": "Get 50% off on vegetables",
    "description": "Get 50% off on vegetables",
  },
];

const allProducts = [
  {
    "name": "Apple",
    "category": "Fruits",
    "image": "Assets/Images/apple.jpg",
    "price": 1.99,
    "unit": "kg",
    "description":
        "The apple tree is a deciduous tree in the rose family best known for its sweet, pomaceous fruit, the apple. It is cultivated worldwide as a fruit tree, and is the most widely grown species in the genus Malus.",
  },
  {
    "name": "Banana",
    "category": "Fruits",
    "image": "Assets/Images/banana.jpg",
    "price": 0.99,
    "unit": "kg",
    "description":
        "The banana is an edible fruit – botanically a berry – produced by several kinds of large herbaceous flowering plants in the genus Musa.",
  },
  {
    "name": "Orange",
    "category": "Fruits",
    "image": "Assets/Images/orange.jpg",
    "price": 1.49,
    "unit": "kg",
    "description":
        "The orange is the fruit of the citrus species Citrus × sinensis in the family Rutaceae; it is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange.",
  },
  {
    "name": "Strawberry",
    "category": "Fruits",
    "image": "Assets/Images/strawberry.jpg",
    "price": 2.99,
    "unit": "kg",
    "description":
        "The garden strawberry (or simply strawberry; Fragaria × ananassa) is a widely grown hybrid species of the genus Fragaria, collectively known as the strawberries, which are cultivated worldwide for their fruit.",
  },
  {
    "name": "Tomato",
    "category": "Fruits",
    "image": "Assets/Images/tomato.jpg",
    "price": 1.99,
    "unit": "kg",
    "description":
        "The tomato is the edible, often red, berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America. The Nahuatl (Aztec) word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived.",
  },
  {
    "name": "Potato",
    "category": "vegetables",
    "image": "Assets/Images/potato.jpg",
    "price": 0.99,
    "unit": "kg",
    "description":
        "The potato is a starchy, tuberous crop from the perennial nightshade Solanum tuberosum. The word \"potato\" may refer either to the plant itself or to the edible tuber. In the Andes, where the species is indigenous, there are some other closely related cultivated potato species.",
  },
  {
    "name": "Onion",
    "category": "vegetables",
    "image": "Assets/Images/onion.jpg",
    "price": 0.99,
    "unit": "kg",
    "description":
        "The onion, also known as the bulb onion or common onion, is a vegetable that is the most widely cultivated species of the genus Allium. This genus also contains several other species variously referred to as \"onions\" and \"potatoes\", among several other names.",
  },
];

const userInfo = {
  "name": "Aashish Singh",
  "email": "awead@gmail.com",
  "phone": "1234567890",
  "address": "Bangalore, India",
  "image": "Assets/Images/my_photo.jpeg",
};

List<Map<String, dynamic>> pendingOrders = [
  {
    "id": 1,
    "date": "2020-05-01",
    "status": "pending",
    "buyer": "Aashish Singh",
    "payment": "Cash on Delivery",
    "total": 10.99,
    "items": [
      {
        "name": "Apple",
        "image": "Assets/Images/apple.jpg",
        "price": 1.99,
        "quantity": 1,
      },
      {
        "name": "Banana",
        "image": "Assets/Images/banana.jpg",
        "price": 0.99,
        "quantity": 5,
      },
      {
        "name": "Orange",
        "image": "Assets/Images/orange.jpg",
        "price": 1.49,
        "quantity": 1,
      },
    ],
  },
];

List<Map<String, dynamic>> comments = [
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "This is a great app",
    "rating": 5,
  },
  {
    "name": "Aashish Singh",
    "image": "Assets/Images/my_photo.jpeg",
    "comment": "ha wow this is a great app",
  }
];
