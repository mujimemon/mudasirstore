class CartManager {
  static final List<Map<String, String>> _cartItems = [];

  static List<Map<String, String>> get cartItems => _cartItems;

  static void addToCart(Map<String, String> item) {
    _cartItems.add(item);
  }
  }
