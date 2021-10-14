import React from 'react';
import {
  SafeAreaView,
  ScrollView,
  View,
  Image,
  Text,
  Pressable,
  Alert,
} from 'react-native';
import RadioForm from 'react-native-simple-radio-button';
import style from '../assets/style/home';
import sortingAlgorithm from '../model/sortingAlgorithm';
import sortingList from '../model/sortingList';

var quant = null;
var algorithm = null;
var type = null;
var list = [];
var listUsed = [];

function sorting() {
  if (quant == null || algorithm == null || type == null) {
    Alert.alert(
      'Ops',
      'Selecione a quantidade de elementos que será ordenado, o algoritmo que será utilizado e o tipo de lista.',
    );

    return false;
  } else {
    var sl = new sortingList();

    if (type == 'det') {
      switch (quant) {
        case 10:
          list = sl.size10();
          break;
        case 100:
          list = sl.size100();
          break;
        case 1000:
          list = sl.size1000();
          break;
        case 10000:
          list = sl.size10000();
          break;
      }
    } else {
      list = sl.randomlist(quant);
    }

    for (var i = 0; i < list.length; i++) {
      listUsed.push(list[i]);
    }

    var sa = new sortingAlgorithm();

    switch (algorithm) {
      case 'bubble':
        sa.bubbleSort(list);
        break;
      case 'quick':
        sa.quickSort(list);
        break;
      case 'merge':
        sa.mergeSort(list);
        break;
      case 'insertion':
        sa.insertionSort(list);
        break;
      case 'selection':
        sa.selectionSort(list);
        break;
    }

    return true;
  }
}

export default props => {
  return (
    <SafeAreaView>
      <ScrollView>
        <View style={style.content}>
          <Image style={style.img} source={require('../assets/img/icon.png')} />
          <Text style={style.title}>
            Análise de desempenho utilizando algortimos de ordenação
          </Text>
          <Text style={style.subtitle}>
            Selecione a quantidade de elementos
          </Text>
          <RadioForm
            radio_props={[
              {label: '10', value: 10},
              {label: '100', value: 100},
              {label: '1000', value: 1000},
              {label: '10000', value: 10000},
            ]}
            labelStyle={{fontSize: 17, marginRight: 10}}
            formHorizontal={true}
            labelHorizontal={true}
            buttonSize={17}
            selectedButtonColor={'#f1641f'}
            buttonColor={'#f1641f'}
            initial={-1}
            onPress={value => {
              quant = value;
            }}
          />
          <Text style={style.subtitle}>Selecione o algoritmo de ordenação</Text>
        </View>
        <View style={style.algorithm}>
          <RadioForm
            radio_props={[
              {label: 'Bubble Sort', value: 'bubble'},
              {label: 'Quick Sort', value: 'quick'},
              {label: 'Merge Sort', value: 'merge'},
              {label: 'Insertion Sort', value: 'insertion'},
              {label: 'Selection Sort', value: 'selection'},
            ]}
            labelStyle={{fontSize: 17, marginRight: 10}}
            formHorizontal={false}
            labelHorizontal={true}
            buttonSize={17}
            selectedButtonColor={'#f1641f'}
            buttonColor={'#f1641f'}
            radioStyle={{paddingBottom: 8}}
            initial={-1}
            onPress={value => {
              algorithm = value;
            }}
          />
        </View>
        <View style={style.content2}>
          <Text style={style.subtitle}>Tipo de Lista</Text>
          <RadioForm
            radio_props={[
              {label: 'Pré Determinada', value: 'det'},
              {label: 'Aleatória', value: 'rand'},
            ]}
            labelStyle={{fontSize: 17, marginRight: 30}}
            formHorizontal={true}
            labelHorizontal={true}
            selectedButtonColor={'#f1641f'}
            buttonColor={'#f1641f'}
            buttonSize={17}
            initial={-1}
            onPress={value => {
              type = value;
            }}
          />
          <Pressable
            style={style.button}
            onPress={() => {
              var valid = sorting();
              if (valid) {
                props.navigation.navigate('Result', {
                  list: list,
                  listUsed: listUsed,
                });
              }
            }}>
            <Text style={style.buttonText}>Ordenar</Text>
          </Pressable>
          <Pressable onPress={() => props.navigation.navigate('About')}>
            <Text style={style.buttonAbout}>Sobre o app</Text>
          </Pressable>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};
