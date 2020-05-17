class Bundle {
  final _map = <String, dynamic>{};

  T get<T>(String key) {
    return _map[key] != null ? _map[key] as T : null;
  }

  void put<T>(String key, T value) {
    _map[key] = value;
  }
  
  void clear() {
    _map.clear();
  }
}
