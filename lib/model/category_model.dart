final testProduct = [
  {
    "id": "1",
    "name": "Psilocybe semilanceata",
    "commonname": "Liberty cap",
    "agent": "psilocybin, psilocin, and baeocystin",
    "distribution": ["North America", "Europe", "Asia", "Australia"],
    "img":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Psilocybe_semilanceata_250px.jpg/500px-Psilocybe_semilanceata_250px.jpg",
    "type": "poisonous",
    "price": 25.99,
    "stock": 126,
    "rate": 3.2,
    "customersRate": 25,
    "discount": 10,
    "choice": true,
  },
  {
    "id": "2",
    "name": "Amanitia semilanceata",
    "commonname": "Liberty cap",
    "agent": "psilocybin, psilocin, and baeocystin",
    "distribution": ["North America", "Europe", "Asia", "Australia"],
    "img":
        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Psilocybe_semilanceata_250px.jpg/500px-Psilocybe_semilanceata_250px.jpg",
    "type": "poisonous",
    "price": 25.99,
    "stock": 126,
    "rate": 3.2,
    "customersRate": 25,
    "discount": 10,
    "choice": true,
  },
];

class CategoryModel {
  static List<dynamic> category = [];
  final int id;
  final String name;

  CategoryModel({required this.id, required this.name});

  static getCategory() {
    testProduct.map((s) {
      String categoryName = (s['name'] as String).split(' ')[0];
      if (CategoryModel.category.contains(categoryName)) {
        CategoryModel.category.add(categoryName);
      }
    });
  }
}
