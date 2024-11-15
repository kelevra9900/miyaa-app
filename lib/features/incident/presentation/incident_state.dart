class IncidentState {
  String? image;
  String? description;
  bool? loading;
  bool? imageSelected;

  IncidentState({
    this.image,
    this.description,
    this.loading = false,
    this.imageSelected = false,
  });

  IncidentState copyWith({
    String? image,
    String? description,
    bool? loading,
    bool? imageSelected,
  }) {
    return IncidentState(
      image: image ?? this.image,
      description: description ?? this.description,
      loading: loading ?? this.loading,
      imageSelected: imageSelected ?? this.imageSelected,
    );
  }
}
