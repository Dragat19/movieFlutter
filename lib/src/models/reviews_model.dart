class Reviews {
  List<Review> items = new List();

  Reviews();

  Reviews.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final review = new Review.fromJsonMap(item);
      items.add(review);
    }
  }
}

class Review {
  String id;
  String author;
  String content;
  String url;
  

  Review({
    this.id,
    this.author,
    this.content,
    this.url
  });

  Review.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    author = json['author'];
    content = json['content'];
    url = json['url'];
  }



}