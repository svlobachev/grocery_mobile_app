class Order {
  String orderId;

  String name;
  String orderStatus;

  String datetime;
  String orderOption;
  String amount;
  Order({this.amount, this.name, this.datetime, this.orderId, this.orderOption, this.orderStatus});
}
