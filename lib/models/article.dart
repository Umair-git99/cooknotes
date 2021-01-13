class Article {
  String title;
  String content;

  Article({this.title, this.content});

  Article.copy(Article from)
      : this(
          title: from.title,
          content: from.content,
        );
}
