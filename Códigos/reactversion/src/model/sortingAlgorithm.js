class sortingAlgorithm {
  bubbleSort(vector) {
    var hasChange = true;
    while (hasChange) {
      hasChange = false;
      for (let i = 0; i < vector.length; i++) {
        if (vector[i] > vector[i + 1]) {
          let aux = vector[i];
          vector[i] = vector[i + 1];
          vector[i + 1] = aux;
          hasChange = true;
        }
      }
    }

    return vector;
  }

  quickSort(vector) {
    if (vector.length <= 1) return vector;

    let left = [];
    let right = [];

    let middle = Math.trunc(vector.length / 2);
    let pivot = vector[middle];

    for (let i = 0; i < vector.length; i++) {
      if (i != middle) {
        if (vector[i] < pivot) left.push(vector[i]);
        else right.push(vector[i]);
      }
    }

    let pivotArray = [pivot];
    return this.quickSort(left).concat(pivotArray, this.quickSort(right));
  }

  mergeSort(vector) {
    if (vector.length < 2) return vector;

    var middle = Math.round(vector.length / 2);
    var left = vector.slice(0, middle);
    var right = vector.slice(middle, vector.length);

    return this.merge(this.mergeSort(left), this.mergeSort(right));
  }

  merge(left, right) {
    var vector = [];

    while (left.length && right.length) {
      if (left[0] <= right[0]) vector.push(left.shift());
      else vector.push(right.shift());
    }

    while (left.length) vector.push(left.shift());

    while (right.length) vector.push(right.shift());

    return vector;
  }

  insertionSort(vector) {
    for (let i = 1; i < vector.length; i++) {
      let key = vector[i];
      let j = i - 1;

      while (j >= 0 && vector[j] > key) {
        vector[j + 1] = vector[j];
        j = j - 1;
      }

      vector[j + 1] = key;
    }
  }

  selectionSort(vector) {
    for (let i = 0; i < vector.length; i++) {
      let min = i;

      for (let j = i + 1; j < vector.length; j++)
        if (vector[min] > vector[j]) min = j;

      if (min !== i) {
        let aux = vector[i];
        vector[i] = vector[min];
        vector[min] = aux;
      }
    }
  }
}

export default sortingAlgorithm;
