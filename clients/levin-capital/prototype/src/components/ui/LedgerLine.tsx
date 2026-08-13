// LedgerLine — the Levin Capital brand loading indicator
// A thin horizontal line that fills left-to-right.
// Used instead of a spinner or bubble animation for tool-call state.
// Per Snape brand spec: the ledger line is the core brand motif.

import React, { useEffect, useRef } from 'react';
import { Animated, StyleSheet, View } from 'react-native';
import { Colors } from '../../constants/tokens';

type Props = {
  active: boolean;
  height?: number;
};

export function LedgerLine({ active, height = 2 }: Props) {
  const progress = useRef(new Animated.Value(0)).current;
  const loop = useRef<Animated.CompositeAnimation | null>(null);

  useEffect(() => {
    if (active) {
      progress.setValue(0);
      loop.current = Animated.loop(
        Animated.sequence([
          Animated.timing(progress, {
            toValue: 1,
            duration: 1600,
            useNativeDriver: false, // width animation requires JS driver
          }),
          Animated.timing(progress, {
            toValue: 0,
            duration: 0,
            useNativeDriver: false,
          }),
        ])
      );
      loop.current.start();
    } else {
      loop.current?.stop();
      progress.setValue(0);
    }

    return () => {
      loop.current?.stop();
    };
  }, [active, progress]);

  const width = progress.interpolate({
    inputRange: [0, 1],
    outputRange: ['0%', '100%'],
  });

  return (
    <View style={[styles.track, { height }]}>
      <Animated.View
        style={[
          styles.fill,
          { width, height },
        ]}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  track: {
    width: '100%',
    backgroundColor: Colors.ruleDark,
    overflow: 'hidden',
  },
  fill: {
    backgroundColor: Colors.accent,
  },
});
