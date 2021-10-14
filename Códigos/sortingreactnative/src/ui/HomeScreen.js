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
// import * as RNFS from 'react-native-fs';

var quant = null;
var algorithm = null;

function sorting() {
  if ((quant = null || algorithm == null)) {
    Alert.alert(
      'Ops',
      'Selecione a quantidade de elementos que será ordenado e o algoritmo que será utilizado.',
    );
  } else {
    // var path = RNFS.DocumentDirectoryPath;
    // console.log(RNFS);
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
            labelStyle={{fontSize: 20, marginRight: 10}}
            formHorizontal={true}
            labelHorizontal={true}
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
            labelStyle={{fontSize: 20, marginRight: 10}}
            formHorizontal={false}
            labelHorizontal={true}
            selectedButtonColor={'#f1641f'}
            buttonColor={'#f1641f'}
            radioStyle={{paddingBottom: 10}}
            initial={-1}
            onPress={value => {
              algorithm = value;
            }}
          />
        </View>
        <View style={style.content}>
          <Pressable style={style.button} onPress={sorting}>
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
