import React from 'react';
import {SafeAreaView, ScrollView, View, Text, Pressable} from 'react-native';
import style from '../assets/style/result';
import {BarChart, Grid} from 'react-native-svg-charts';

export default props => {
  const fill = 'rgb(170, 170, 170)';

  return (
    <SafeAreaView>
      <ScrollView>
        <View style={style.content}>
          <Text style={style.title}>Ordem Inicial</Text>
          <BarChart
            style={{height: 250}}
            data={props.route.params.listUsed}
            svg={{fill}}
            contentInset={{top: 30, bottom: 30}}>
            <Grid />
          </BarChart>
          <Text style={style.title}>Ordem Final</Text>
          <BarChart
            style={{height: 250}}
            data={props.route.params.list}
            svg={{fill}}
            contentInset={{top: 30, bottom: 30}}>
            <Grid />
          </BarChart>
          <Text style={style.timeText}>
            <Text style={style.timeLabel}>Tempo de Execução: </Text>
            <Text style={style.time}>
              {Date.now() - props.route.params.timestampInitial} ms
            </Text>
          </Text>
          <Pressable
            style={style.button}
            onPress={() => props.navigation.goBack()}>
            <Text style={style.buttonText}>Voltar</Text>
          </Pressable>
          <Pressable
            onPress={() => {
              this.props.navigation.navigate('About');
            }}>
            <Text style={style.buttonAbout}>Sobre o app</Text>
          </Pressable>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};
