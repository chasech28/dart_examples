class VocabularyItem {
  final String word; // 英文单词
  final String translation; // 中文翻译

  // 构造函数
  const VocabularyItem({required this.word, required this.translation});

  // 从 Map 转换（用于 JSON 反序列化）
  factory VocabularyItem.fromJson(Map<String, dynamic> json) {
    return VocabularyItem(
      word: json['word'] as String,
      translation: json['translation'] as String,
    );
  }

  // 转换为 Map（用于 JSON 序列化）
  Map<String, dynamic> toJson() {
    return {'word': word, 'translation': translation};
  }

  @override
  String toString() {
    return 'VocabularyItem(word: $word, translation: $translation)';
  }
}

void main() {
  // 创建实例
  final item = VocabularyItem(word: "computer", translation: "计算机");

  // 序列化为 JSON
  final json = item.toJson();
  print(json); // {word: computer, translation: 计算机}

  // 反序列化
  final newItem = VocabularyItem.fromJson(json);
  print(newItem.translation); // 计算机
}
