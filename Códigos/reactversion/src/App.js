import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import HomeUI from './ui/HomeUI';
import AboutUI from './ui/AboutUI';
import ResultUI from './ui/ResultUI';

const Stack = createNativeStackNavigator();

export default () => (
  <NavigationContainer>
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
      }}>
      <Stack.Screen name="Home" component={HomeUI} />
      <Stack.Screen name="Result" component={ResultUI} />
      <Stack.Screen name="About" component={AboutUI} />
    </Stack.Navigator>
  </NavigationContainer>
);
