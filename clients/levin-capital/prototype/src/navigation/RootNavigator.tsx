// RootNavigator — React Navigation native stack
// Two screens: Chat (default) → AccountSummary (from card tap)

import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import type { RootStackParamList } from '../types';
import { ChatScreen } from '../screens/ChatScreen';
import { AccountSummaryScreen } from '../screens/AccountSummaryScreen';
import { Colors } from '../constants/tokens';

const Stack = createNativeStackNavigator<RootStackParamList>();

export function RootNavigator() {
  return (
    <NavigationContainer>
      <Stack.Navigator
        screenOptions={{
          headerShown: false,
          contentStyle: { backgroundColor: Colors.surfaceDark },
          animation: 'slide_from_right',
        }}
      >
        <Stack.Screen name="Chat" component={ChatScreen} />
        <Stack.Screen name="AccountSummary" component={AccountSummaryScreen} />
      </Stack.Navigator>
    </NavigationContainer>
  );
}
