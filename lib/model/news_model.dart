class NewsFeedModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsFeedModel({this.status, this.totalResults, this.articles});

  NewsFeedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    articles = json['articles'] != null
        ? List.generate(json['articles'].length,
            (index) => Articles.fromJson(json['articles'][index]))
        : [];
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
      'articles': articles?.map((v) => v.toJson()).toList(),
    };
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'] ?? "Unknown";
    title = json['title'] ?? "No Title";
    description = json['description'] ?? "No Description";
    url = json['url'];
    urlToImage = json['urlToImage'] ?? "";
    publishedAt = json['publishedAt'] ?? "Unknown Date";
    content = json['content'] ?? "";
  }

  Map<String, dynamic> toJson() {
    return {
      'source': source?.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? "Unknown Source";
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
