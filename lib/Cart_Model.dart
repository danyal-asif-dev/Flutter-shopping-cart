class Cart{
  late final int? id;
  final String? ProductId;
  final String? ProductName;
  final int? initialPrice;
  final int? ProductPrice;
  final int? Quantity;
  final String? unitTag;
  final String? image;

Cart({
  required this.id,
  required this.ProductId,
  required this.ProductName,
  required this.initialPrice,
  required this.ProductPrice,
  required this.Quantity,
  required this.unitTag,
  required this.image,
});

  Cart.fromMap (Map<dynamic,dynamic> res)
  : id = res['id'],
  ProductId = res['ProductId'],
  ProductName = res['ProductName'],
  initialPrice = res['initialPrice'],
  ProductPrice = res['ProductPrice'],
  Quantity = res['Quantity'],
  unitTag = res['unitTag'],
  image = res['image'];

Map<String , Object?> toMap(){
  return {
    'id' : id,
    'ProductId' : ProductId,
    'ProductName' : ProductName,
    'initialPrice' : initialPrice,
    'ProductPrice' : ProductPrice,
    'Quantity' : Quantity,
    'unitTag' : unitTag,
    'image' : image,
  };
}

} 