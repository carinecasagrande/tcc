class SortingAlgorithm {
  void bubbleSort(list) {
    bool hasChange = true;
    while (hasChange) {
      hasChange = false;
      for (int i = 0; i < list.length - 1; i++) {
        if (list[i] > list[i + 1]) {
          int aux = list[i];
          list[i] = list[i + 1];
          list[i + 1] = aux;
          hasChange = true;
        }
      }
    }
  }

  List<int> quickSort(list) {
    if (list.length <= 1) {
      return list;
    }

    List<int> left = [];
    List<int> right = [];

    int middle = list.length ~/ 2;
    int pivot = list[middle];

    for (int i = 0; i < list.length; i++) {
      if (i != middle) {
        if (list[i] < pivot) {
          left.add(list[i]);
        } else {
          right.add(list[i]);
        }
      }
    }

    List<int> pivotlist = [pivot];
    return quickSort(left) + pivotlist + quickSort(right);
  }

  List<int> mergeSort(list) {
    if (list.length < 2) {
      return list;
    }

    int middle = list.length ~/ 2;
    List<int> left = list.sublist(0, middle);
    List<int> right = list.sublist(middle, list.length);

    return merge(mergeSort(left), mergeSort(right));
  }

  List<int> merge(left, right) {
    List<int> vector = [];

    while (left.length > 0 && right.length > 0) {
      if (left[0] <= right[0]) {
        vector.add(left.removeAt(0));
      } else {
        vector.add(right.removeAt(0));
      }
    }

    while (left.length > 0) {
      vector.add(left.removeAt(0));
    }

    while (right.length > 0) {
      vector.add(right.removeAt(0));
    }

    return vector;
  }

  void insertionSort(list) {
    for (int i = 1; i < list.length; i++) {
      int key = list[i];
      int j = i - 1;

      while (j >= 0 && list[j] > key) {
        list[j + 1] = list[j];
        j = j - 1;
      }

      list[j + 1] = key;
    }
  }

  void selectionSort(list) {
    for (int i = 0; i < list.length; i++) {
      int min = i;

      for (int j = i + 1; j < list.length; j++) {
        if (list[min] > list[j]) min = j;
      }

      if (min != i) {
        int aux = list[i];
        list[i] = list[min];
        list[min] = aux;
      }
    }
  }
}
