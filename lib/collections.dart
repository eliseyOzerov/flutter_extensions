extension MapExtension<T, K> on Map<T, K> {
  /// Merges [other] into this.
  Map<T, K> merge(Map<T, K> other) {
    final Map<T, K> res = Map<T, K>.from(this);
    for (final key in other.keys) {
      res[key] = other[key] as K;
    }
    return res;
  }

  Map<String, dynamic> convertMap({Map? original}) {
    final Map<String, dynamic> result = {};
    (original ?? this).forEach((key, value) {
      if (value is Map) {
        result[key.toString()] = convertMap(original: value);
      } else {
        result[key.toString()] = value;
      }
    });
    return result;
  }
}

extension IterableExtension<T> on Iterable<T> {
  Iterable<T> toOrderedSet() {
    if (isEmpty) {
      return this;
    }
    T? current;
    return where((element) {
      if (element == current) {
        return false;
      }
      current = element;
      return true;
    });
  }
}

extension TExtension<T> on T {
  bool isIn(List<T> list) {
    return list.contains(this);
  }
}

extension DynamicListExtension on List<dynamic> {
  List<T> cast<T>() {
    return map((e) => e as T).toList();
  }
}

extension ListExtension<T> on List<T> {
  List<T> safeSublist(int start, [int? end]) {
    if (start > length) {
      return this;
    }
    if (end == null) {
      return sublist(start);
    }
    if (end < 0) {
      return sublist(start, length + end);
    }
    if (end < start) {
      return [];
    }
    if (end > length) {
      return sublist(start);
    }
    return sublist(start, end);
  }

  List<T> queueAdd(T item, int maxSize) {
    if (length >= maxSize) {
      removeAt(0);
    }
    add(item);
    return this;
  }

  List<T> lastN(int n) {
    if (n >= length) {
      return this;
    }
    return sublist(length - n);
  }

  /// Returns the list separated by the given item
  List<T> separatedBy(T item) {
    if (isEmpty) {
      return this;
    }

    final List<T> result = [];

    forEach((element) {
      result
        ..add(element)
        ..add(item);
    });

    result.removeLast();

    return result;
  }

  /// Sorts the list and returns it.
  List<T> sorted(int Function(T, T) compare) {
    if (isEmpty) {
      return this;
    }
    sort(compare);
    return this;
  }

  /// Returns a sorted copy of the list.
  List<T> sortedCopy(int Function(T, T) compare) {
    return List<T>.from(this..sort(compare));
  }

  List<T> nonNull() {
    return where((element) => element != null).toList();
  }

  bool equal(List other, {bool Function(T, T)? compare}) {
    if (length != other.length) {
      return false;
    }

    for (int i = 0; i < length; i++) {
      if (compare != null) {
        if (!compare(this[i], other[i])) {
          return false;
        }
      } else if (this[i] != other[i]) {
        return false;
      }
    }

    return true;
  }

  List<List<T>> groupBy(int Function(T) group) {
    final Map<int, List<T>> groups = {};

    forEach((element) {
      final int key = group(element);
      if (groups.containsKey(key)) {
        groups[key]!.add(element);
      } else {
        groups[key] = [element];
      }
    });

    return groups.values.toList();
  }

  T? firstWhereOrNull(bool Function(T) test) {
    try {
      return firstWhere(test);
    } catch (e) {
      return null;
    }
  }
}
