class MetaModel {
  final int total;
  final int totalPages;
  final int perPage;
  final int currentPage;
  final int lastPage;

  MetaModel({
    required this.total,
    required this.totalPages,
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) => MetaModel(
    total: json["total"],
    totalPages: json["last_page"],
    perPage: json["per_page"],
    currentPage: json["current_page"],
    lastPage: json["last_page"],
  );
}