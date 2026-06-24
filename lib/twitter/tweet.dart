class Tweet {
  int id;
  String profile;
  int created_date;
  String author;
  String message;

  //<editor-fold desc="Data Methods">
  Tweet({
    required this.id,
    required this.profile,
    required this.created_date,
    required this.author,
    required this.message,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tweet &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          profile == other.profile &&
          created_date == other.created_date &&
          author == other.author &&
          message == other.message);

  @override
  int get hashCode =>
      id.hashCode ^
      profile.hashCode ^
      created_date.hashCode ^
      author.hashCode ^
      message.hashCode;

  @override
  String toString() {
    return 'Tweet{' +
        ' id: $id,' +
        ' profile: $profile,' +
        ' created_date: $created_date,' +
        ' author: $author,' +
        ' message: $message,' +
        '}';
  }

  Tweet copyWith({
    int? id,
    String? profile,
    int? created_date,
    String? author,
    String? message,
  }) {
    return Tweet(
      id: id ?? this.id,
      profile: profile ?? this.profile,
      created_date: created_date ?? this.created_date,
      author: author ?? this.author,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'profile': this.profile,
      'created_date': this.created_date,
      'author': this.author,
      'message': this.message,
    };
  }

  factory Tweet.fromMap(Map<String, dynamic> map) {
    return Tweet(
      id: map['id'] as int,
      profile: map['profile'] as String,
      created_date: map['created_date'] as int,
      author: map['author'] as String,
      message: map['message'] as String,
    );
  }

  //</editor-fold>
}