class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  static List<Category> getDummyCategory() {
    List<Category> categories = [
      Category(
        id: 0,
        name: "Business",
      ),
      Category(
        id: 1,
        name: "Commodity",
      ),
      Category(
        id: 2,
        name: "Customer",
      ),
      Category(
        id: 3,
        name: "Information",
      ),
      Category(
        id: 4,
        name: "Intellectual",
      ),
      Category(
        id: 5,
        name: "Real estate",
      ),
      Category(
        id: 6,
        name: "Sponsorship",
      ),
      Category(
        id: 7,
        name: "Stock",
      ),
      Category(
        id: 8,
        name: "office",
      ),
      Category(
        id: 9,
        name: "Serviced",
      ),
      Category(
        id: 10,
        name: "Insurance",
      ),
      Category(
        id: 11,
        name: "Discount",
      ),
      Category(
        id: 12,
        name: "Credit",
      ),
      Category(
        id: 13,
        name: "Leasing",
      ),
    ];
    return categories;
  }
}
