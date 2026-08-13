// TimestampDivider — centered timestamp between turns when gap > 5 min
// Per Snape brand spec: body-sm, text-secondary, centered

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Colors, Spacing, TypographyStyle } from '../../constants/tokens';
import { formatTimestamp } from '../../utils/format';

type Props = {
  timestamp: string;
};

export function TimestampDivider({ timestamp }: Props) {
  return (
    <View style={styles.container}>
      <View style={styles.line} />
      <Text style={styles.label}>{formatTimestamp(timestamp)}</Text>
      <View style={styles.line} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: Spacing.s6,
    marginVertical: Spacing.s3,
    gap: Spacing.s3,
  },
  line: {
    flex: 1,
    height: 1,
    backgroundColor: Colors.ruleDark,
  },
  label: {
    ...TypographyStyle.bodySm,
    fontSize: 11,
    color: Colors.textSecondary,
  },
});
