class Methods {
  static Object? getDataHasMap(
    Map<String, Object?>? data, {
    required String fieldName,
    String? defaultValue,
  }) {
    if (data == null || data.isEmpty) return defaultValue;
    if (data.containsKey(fieldName)) {
      Object? val = data[fieldName];
      if (val != null && val.toString().isNotEmpty) {
        return val;
      }
    }
    return defaultValue;
  }

  static String getString(
    Map<String, Object?>? data, {
    required String fieldName,
    String defaultValue = '',
  }) {
    return getDataHasMap(
      data,
      fieldName: fieldName,
      defaultValue: defaultValue,
    ).toString();
  }

  static int toInt(
    String? source, {
    int defaultValue = 0,
  }) {
    if (source == null) return defaultValue;
    return int.tryParse(source) ?? defaultValue;
  }

  static int getInt(
    Map<String, Object?>? data, {
    required String fieldName,
    int defaultValue = 0,
  }) {
    return toInt(
      getDataHasMap(data, fieldName: fieldName).toString(),
      defaultValue: defaultValue,
    );
  }
}
