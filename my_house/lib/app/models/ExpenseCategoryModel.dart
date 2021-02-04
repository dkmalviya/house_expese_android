class ExpenseCategoryModel{
  String categoryName;
  bool isFavorite;

  ExpenseCategoryModel(this.categoryName, this.isFavorite);

  @override
  String toString() {
    return 'ExpenseCategoryModel{categoryName: $categoryName, isFavorite: $isFavorite}';
  }
}