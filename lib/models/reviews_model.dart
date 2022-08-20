class ReviewModel{
  double rating;
  int reviews;
  List<int> positive;
  List<int> negative;
  List<int> color;
  List<String> title;
  List<int> bgColor;

  ReviewModel(this.rating,this.reviews,this.positive,this.color,this.negative,this.bgColor,this.title);
}