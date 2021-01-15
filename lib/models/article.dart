class Article {
  String title;
  String image;
  String author;
  String content;

  Article({this.title, this.image, this.author, this.content});

  Article.copy(Article from)
      : this(
          title: from.title,
          image: from.image,
          author: from.author,
          content: from.content,
        );
}
