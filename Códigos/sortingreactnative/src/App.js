import React from 'react';
import {NavigationContainer} from '@react-navigation/native';
import {createNativeStackNavigator} from '@react-navigation/native-stack';
import HomeScreen from './ui/HomeScreen';
import AboutScreen from './ui/AboutScreen';
import ResultScreen from './ui/ResultScreen';

const Stack = createNativeStackNavigator();

export default () => (
  <NavigationContainer>
    <Stack.Navigator
      screenOptions={{
        headerShown: false,
      }}>
      <Stack.Screen name="Home" component={HomeScreen} />
      <Stack.Screen name="Result" component={ResultScreen} />
      <Stack.Screen name="About" component={AboutScreen} />
    </Stack.Navigator>
  </NavigationContainer>
);
