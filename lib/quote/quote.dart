class Quote {
  String quote;
  String author;
  String category;
  Quote({required this.quote, required this.author, required this.category});
  factory Quote.fromJson(Map <String, dynamic> json) {
return Quote(quote: json["quote"], author: json["author"], category: json["category"]);
  }
}