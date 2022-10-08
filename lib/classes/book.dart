class Book {
  late String title, publishedDate, description, imageLink, pageCount, selfLink;

  Book(Map<String, dynamic> book) {
    title = book['title'] ?? "-";
    publishedDate = book['publishedDate'] ?? "-";
    description = book['description'] ?? "-";
    pageCount = book['pageCount'] != null ? book['pageCount'].toString() : "-";
    imageLink =
        book['imageLinks'] != null ? book['imageLinks']['thumbnail'] : "";
    selfLink = book["canonicalVolumeLink"];
  }

  @override
  String toString() {
    return "Title: $title Published Date: $publishedDate Description: $description Page count: $pageCount ImageLink: $imageLink";
  }
}
