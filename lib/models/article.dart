class Article {
  String title;
  String author;
  String content;
  String date;

  Article({this.title, this.author, this.content, this.date});

  Article.copy(Article from)
      : this(
            title: from.title,
            author: from.author,
            content: from.content,
            date: from.date);
}
