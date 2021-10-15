import React from 'react';
import {SafeAreaView, ScrollView, View, Text, Pressable} from 'react-native';
import style from '../assets/style/about';

export default props => {
  return (
    <SafeAreaView>
      <ScrollView>
        <View style={style.content}>
          <Text>Tela do resultado</Text>
        </View>
      </ScrollView>
    </SafeAreaView>
  );
};
