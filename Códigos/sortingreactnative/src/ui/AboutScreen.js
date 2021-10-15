import React from 'react';
import {SafeAreaView, ScrollView, View, Text, Pressable} from 'react-native';
import style from '../assets/style/about';

export default props => (
  <SafeAreaView>
    <ScrollView>
      <View style={style.content}>
        <Text style={style.title}>Versão Flutter</Text>
        <Text style={style.subtitle}>Carine Casa Grande</Text>
        <Text style={style.titlePaperwork}>
          Comparação entre o desempenho de aplicações para smartphones
          desenvolvidos em Flutter e React Native:
        </Text>
        <Text style={style.subtitlePaperwork}>
          Uma análise utilizando algoritmos de ordenação
        </Text>
        <Text style={style.description}>
          Trabalho de Conclusão de Curso apresentado ao Curso de Ciência da
          Computação do Centro Universitário Filadélfia – UniFil, como requisito
          parcial à obtenção do título de Bacharel em Ciência da Computação.
          {'\n\n'}Orientadora: Profª. Simone Sawasaki Tanaka
        </Text>
        <Text style={style.location}>Londrina{'\n'}2021</Text>
        <Pressable
          style={style.button}
          onPress={() => props.navigation.goBack()}>
          <Text style={style.buttonText}>Voltar</Text>
        </Pressable>
      </View>
    </ScrollView>
  </SafeAreaView>
);
