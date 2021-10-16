import React from 'react';
import {SafeAreaView, ScrollView, View, Text, Pressable} from 'react-native';
import style from '../assets/style/about';

export default props => (
  <SafeAreaView>
    <ScrollView>
      <View style={style.content}>
        <Text>Tela dos Resultados</Text>
        <Pressable
          style={style.button}
          onPress={() => props.navigation.goBack()}>
          <Text style={style.buttonText}>Voltar</Text>
        </Pressable>
      </View>
    </ScrollView>
  </SafeAreaView>
);
