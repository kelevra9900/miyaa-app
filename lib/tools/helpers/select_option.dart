class SelectOption {
  String? label;
  String? icon;
  String? description;
  dynamic value;
  String? key;
  TypeRadioButton? type;

  SelectOption({
    required this.label,
    this.value,
    this.icon,
    this.description,
    this.key,
    this.type = TypeRadioButton.none,
  });

  SelectOption.fromJson(Map<String, dynamic> json) {
    label = json['label'] ?? json['name'] ?? '';
    value = json['value'] ?? json['id'] ?? '';
    icon = json['icon'];
    description = json['description'];
    key = json['key'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['label'] = label;
    data['value'] = value;
    data['icon'] = icon;
    data['description'] = description;
    data['key'] = key;
    data['type'] = type;
    return data;
  }
}

enum TypeRadioButton {
  dropdown,
  internalButton,
  withArrowRigth,
  none,
}
