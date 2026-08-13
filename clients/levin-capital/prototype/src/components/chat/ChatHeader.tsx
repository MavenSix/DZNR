// ChatHeader — top navigation bar for the chat screen
// Contains: LC mark (brand identity), wordmark, optional back/close
// Per Snape spec: LC mark in header only, no bubble avatars

import React from 'react';
import { View, Text, StyleSheet, Platform } from 'react-native';
import { Colors, Spacing, TypographyStyle, FontSize, FontWeight } from '../../constants/tokens';
import { LCMark } from '../ui/LCMark';

type Props = {
  subtitle?: string;
};

export function ChatHeader({ subtitle }: Props) {
  return (
    <View style={styles.container}>
      <View style={styles.inner}>
        <LCMark size={20} color={Colors.textPrimary} accentColor={Colors.accent} />
        <View style={styles.textBlock}>
          <Text style={styles.wordmark}>LEVIN CAPITAL</Text>
          {subtitle && <Text style={styles.subtitle}>{subtitle}</Text>}
        </View>
      </View>
      {/* Ledger line rule under header */}
      <View style={styles.rule} />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: Colors.surfaceDark,
    paddingTop: Platform.OS === 'ios' ? 54 : Spacing.s4,
    paddingBottom: 0,
  },
  inner: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: Spacing.s5,
    paddingBottom: Spacing.s4,
    gap: Spacing.s3,
  },
  textBlock: {
    gap: 2,
  },
  wordmark: {
    fontSize: FontSize.label + 1,
    fontWeight: FontWeight.semibold,
    color: Colors.textPrimary,
    letterSpacing: 2,
  },
  subtitle: {
    ...TypographyStyle.bodySm,
    fontSize: 11,
  },
  rule: {
    height: 1,
    backgroundColor: Colors.ruleDark,
  },
});
