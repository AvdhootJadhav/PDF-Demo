class Orders {
  final String item;
  final String price;
  final String quantity;
  
  Orders({
    this.item,
    this.price,
    this.quantity,
  });

  String getIndex(int index){
    switch(index){
      case 0:
      return item;
      case 1:
      return price;
      case 2:
      return quantity;
    }
    return '';
  }
  
}
  