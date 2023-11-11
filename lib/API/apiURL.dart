const String serverName = 'https://e-solutionsgroup.org/';

enum APIS { getProducts, getCart,}

class ApiName {
  static String name(APIS k) {
    switch (k) {
      case APIS.getProducts:
        return 'all_products.php';
      case APIS.getCart:
        return 'cart.php';
      default:
        return '';
    }
  }
}
