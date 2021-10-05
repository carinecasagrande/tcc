/**
 * Implementação regular do Bubble Sort
 * Fonte: Programiz (https://www.programiz.com/dsa/bubble-sort)
 * Apdatado por Carine Casa Grande
 */
function bubbleSortRegular(vector) {
    for (let j = 0; j < vector.length; j++) {
        for (let i = 0; i < vector.length; i++) {
            if (vector[i] > vector[i + 1]) {
                let aux = vector[i];
                vector[i] = vector[i + 1];
                vector[i + 1] = aux;
            }
        }
    }
}

/**
 * Implementação otimizada do Bubble Sort
 * Fonte: Programiz (https://www.programiz.com/dsa/bubble-sort)
 * Apdatado por Carine Casa Grande
 */
function bubbleSortOptimized(vector) {
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
}

/**
 * Implementação do Quick Sort
 * Fonte: Wang Lichao (https://gist.github.com/0532/436b6c5cd2317a45ec3e)
 * Adaptado por Carine Casa Grande
 */
function quickSort(vector) {
    if (vector.length <= 1)
        return vector;

    let left = [];
    let right = [];

    let middle = Math.trunc(vector.length / 2);
    let pivot = vector[middle];

    for (let i = 0; i < vector.length; i++) {
        if (i != middle) {
            if (vector[i] < pivot)
                left.push(vector[i]);
            else
                right.push(vector[i]);
        }
    }

    return quickSort(left).concat(pivot, quickSort(right));
}

/**
 * Implementação do Merge Sort
 * Fonte: Brianna Veenstra (https://github.com/sf-wdi-31/mergesort)
 * Adaptado por Carine Casa Grande
 */
function mergeSort(vector) {
    if (vector.length < 2)
        return vector;

    var middle = Math.round(vector.length / 2);
    var left = vector.slice(0, middle);
    var right = vector.slice(middle, vector.length);

    return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right) {
    var vector = [];

    while (left.length && right.length) {
        if (left[0] <= right[0])
            vector.push(left.shift());
        else
            vector.push(right.shift());
    }

    while (left.length)
        vector.push(left.shift());

    while (right.length)
        vector.push(right.shift());

    return vector;
}

/**
 * Implementação do Merge Sort
 * Fonte: GeeksforGeeks (https://www.geeksforgeeks.org/insertion-sort/)
 * Adaptado por Carine Casa Grande
 */
function insertionSort(vector) {
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

/**
 * Implementação do Selection Sort
 * Fonte: Kyle Jensen (https://medium.com/javascript-algorithms/javascript-algorithms-selection-sort-54da919d0513)
 * Adaptador por Carine Casa Grande
 */
function selectionSort(vector) {
    for (let i = 0; i < vector.length; i++) {
        let min = i;

        for (let j = i + 1; j < vector.length; j++)
            if (vector[min] > vector[j])
                min = j;

        if (min !== i) {
            let aux = vector[i];
            vector[i] = vector[min];
            vector[min] = aux;
        }
    }
}