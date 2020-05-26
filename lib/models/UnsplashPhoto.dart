import 'dart:convert';

UnsplashPhoto unsplashPhotoFromJson(String str) => UnsplashPhoto.fromMap(json.decode(str));

String unsplashPhotoToJson(UnsplashPhoto data) => json.encode(data.toMap());

class UnsplashPhoto {
  int total;
  int totalPages;
  List<Result> results;

  UnsplashPhoto({
    this.total,
    this.totalPages,
    this.results,
  });

  factory UnsplashPhoto.fromMap(Map<String, dynamic> json) => UnsplashPhoto(
    total: json["total"],
    totalPages: json["total_pages"],
    results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "total": total,
    "total_pages": totalPages,
    "results": List<dynamic>.from(results.map((x) => x.toMap())),
  };
}

class Result {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  String description;
  String altDescription;
  Urls urls;
  ResultLinks links;
  List<dynamic> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  User user;
  List<Tag> tags;

  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.user,
    this.tags,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    description: json["description"] == null ? null : json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromMap(json["urls"]),
    links: ResultLinks.fromMap(json["links"]),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    user: User.fromMap(json["user"]),
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt == null ? null : promotedAt.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "description": description == null ? null : description,
    "alt_description": altDescription,
    "urls": urls.toMap(),
    "links": links.toMap(),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "user": user.toMap(),
    "tags": List<dynamic>.from(tags.map((x) => x.toMap())),
  };
}

class ResultLinks {
  String self;
  String html;
  String download;
  String downloadLocation;

  ResultLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  factory ResultLinks.fromMap(Map<String, dynamic> json) => ResultLinks(
    self: json["self"],
    html: json["html"],
    download: json["download"],
    downloadLocation: json["download_location"],
  );

  Map<String, dynamic> toMap() => {
    "self": self,
    "html": html,
    "download": download,
    "download_location": downloadLocation,
  };
}

class Tag {
  Type type;
  String title;
  Source source;

  Tag({
    this.type,
    this.title,
    this.source,
  });

  factory Tag.fromMap(Map<String, dynamic> json) => Tag(
    type: typeValues.map[json["type"]],
    title: json["title"],
    source: json["source"] == null ? null : Source.fromMap(json["source"]),
  );

  Map<String, dynamic> toMap() => {
    "type": typeValues.reverse[type],
    "title": title,
    "source": source == null ? null : source.toMap(),
  };
}

class Source {
  Ancestry ancestry;
  String title;
  String subtitle;
  String description;
  String metaTitle;
  String metaDescription;
  CoverPhoto coverPhoto;

  Source({
    this.ancestry,
    this.title,
    this.subtitle,
    this.description,
    this.metaTitle,
    this.metaDescription,
    this.coverPhoto,
  });

  factory Source.fromMap(Map<String, dynamic> json) => Source(
    ancestry: Ancestry.fromMap(json["ancestry"]),
    title: json["title"],
    subtitle: json["subtitle"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    coverPhoto: CoverPhoto.fromMap(json["cover_photo"]),
  );

  Map<String, dynamic> toMap() => {
    "ancestry": ancestry.toMap(),
    "title": title,
    "subtitle": subtitle,
    "description": description,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "cover_photo": coverPhoto.toMap(),
  };
}

class Ancestry {
  Category type;
  Category category;
  Category subcategory;

  Ancestry({
    this.type,
    this.category,
    this.subcategory,
  });

  factory Ancestry.fromMap(Map<String, dynamic> json) => Ancestry(
    type: Category.fromMap(json["type"]),
    category: Category.fromMap(json["category"]),
    subcategory: json["subcategory"] == null ? null : Category.fromMap(json["subcategory"]),
  );

  Map<String, dynamic> toMap() => {
    "type": type.toMap(),
    "category": category.toMap(),
    "subcategory": subcategory == null ? null : subcategory.toMap(),
  };
}

class Category {
  String slug;
  String prettySlug;

  Category({
    this.slug,
    this.prettySlug,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    slug: json["slug"],
    prettySlug: json["pretty_slug"],
  );

  Map<String, dynamic> toMap() => {
    "slug": slug,
    "pretty_slug": prettySlug,
  };
}

class CoverPhoto {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime promotedAt;
  int width;
  int height;
  String color;
  String description;
  String altDescription;
  Urls urls;
  ResultLinks links;
  List<dynamic> categories;
  int likes;
  bool likedByUser;
  List<dynamic> currentUserCollections;
  dynamic sponsorship;
  User user;

  CoverPhoto({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.user,
  });

  factory CoverPhoto.fromMap(Map<String, dynamic> json) => CoverPhoto(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    promotedAt: DateTime.parse(json["promoted_at"]),
    width: json["width"],
    height: json["height"],
    color: json["color"],
    description: json["description"],
    altDescription: json["alt_description"],
    urls: Urls.fromMap(json["urls"]),
    links: ResultLinks.fromMap(json["links"]),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    likes: json["likes"],
    likedByUser: json["liked_by_user"],
    currentUserCollections: List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"],
    user: User.fromMap(json["user"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "promoted_at": promotedAt.toIso8601String(),
    "width": width,
    "height": height,
    "color": color,
    "description": description,
    "alt_description": altDescription,
    "urls": urls.toMap(),
    "links": links.toMap(),
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "likes": likes,
    "liked_by_user": likedByUser,
    "current_user_collections": List<dynamic>.from(currentUserCollections.map((x) => x)),
    "sponsorship": sponsorship,
    "user": user.toMap(),
  };
}

class Urls {
  String raw;
  String full;
  String regular;
  String small;
  String thumb;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  factory Urls.fromMap(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
  );

  Map<String, dynamic> toMap() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
  };
}

class User {
  String id;
  DateTime updatedAt;
  String username;
  String name;
  String firstName;
  String lastName;
  String twitterUsername;
  String portfolioUrl;
  String bio;
  String location;
  UserLinks links;
  ProfileImage profileImage;
  String instagramUsername;
  int totalCollections;
  int totalLikes;
  int totalPhotos;
  bool acceptedTos;

  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
  });

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    username: json["username"],
    name: json["name"],
    firstName: json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    twitterUsername: json["twitter_username"] == null ? null : json["twitter_username"],
    portfolioUrl: json["portfolio_url"] == null ? null : json["portfolio_url"],
    bio: json["bio"] == null ? null : json["bio"],
    location: json["location"] == null ? null : json["location"],
    links: UserLinks.fromMap(json["links"]),
    profileImage: ProfileImage.fromMap(json["profile_image"]),
    instagramUsername: json["instagram_username"],
    totalCollections: json["total_collections"],
    totalLikes: json["total_likes"],
    totalPhotos: json["total_photos"],
    acceptedTos: json["accepted_tos"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "updated_at": updatedAt.toIso8601String(),
    "username": username,
    "name": name,
    "first_name": firstName,
    "last_name": lastName == null ? null : lastName,
    "twitter_username": twitterUsername == null ? null : twitterUsername,
    "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
    "bio": bio == null ? null : bio,
    "location": location == null ? null : location,
    "links": links.toMap(),
    "profile_image": profileImage.toMap(),
    "instagram_username": instagramUsername,
    "total_collections": totalCollections,
    "total_likes": totalLikes,
    "total_photos": totalPhotos,
    "accepted_tos": acceptedTos,
  };
}

class UserLinks {
  String self;
  String html;
  String photos;
  String likes;
  String portfolio;
  String following;
  String followers;

  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  factory UserLinks.fromMap(Map<String, dynamic> json) => UserLinks(
    self: json["self"],
    html: json["html"],
    photos: json["photos"],
    likes: json["likes"],
    portfolio: json["portfolio"],
    following: json["following"],
    followers: json["followers"],
  );

  Map<String, dynamic> toMap() => {
    "self": self,
    "html": html,
    "photos": photos,
    "likes": likes,
    "portfolio": portfolio,
    "following": following,
    "followers": followers,
  };
}

class ProfileImage {
  String small;
  String medium;
  String large;

  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  factory ProfileImage.fromMap(Map<String, dynamic> json) => ProfileImage(
    small: json["small"],
    medium: json["medium"],
    large: json["large"],
  );

  Map<String, dynamic> toMap() => {
    "small": small,
    "medium": medium,
    "large": large,
  };
}

enum Type { SEARCH, LANDING_PAGE }

final typeValues = EnumValues({
  "landing_page": Type.LANDING_PAGE,
  "search": Type.SEARCH
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
