
class BookingsModel{
  int totalBookings;
  int cancelledByYou;
  int cancelledByGuest;
  List<double> ydata;
  List<String> xdata;
  List<String> range;
  List<int> qty;
  List<int> color;
  List<double> val;

  BookingsModel(this.totalBookings,this.cancelledByYou,this.cancelledByGuest,this.xdata,this.ydata,this.range,this.qty,this.color,this.val);
}