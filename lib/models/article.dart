class Article {
  String title;
  String image;
  String author;
  String content;
  String date;

  Article({this.title, this.image, this.author, this.content, this.date});

  Article.copy(Article from)
      : this(
            title: from.title,
            image: from.image,
            author: from.author,
            content: from.content,
            date: from.date);
}
