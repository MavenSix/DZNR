// EmptyState — shown when conversation has no messages
// Per copy rules: no exclamation marks, one clear next action

import React from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import { Colors, Spacing, TypographyStyle, FontSize, FontWeight, Radius } from '../../constants/tokens';
import { LCMark } from '../ui/LCMark';
import { MOCK_CLIENT } from '../../mock/data';

const SUGGESTED_PROMPTS = [
  'What is my current portfolio balance?',
  'How has my growth portfolio performed this year?',
  'Show me my most recent transactions.',
  'Schedule a call with my advisor.',
];

type Props = {
  onSelectPrompt: (prompt: string) => void;
};

export function EmptyState({ onSelectPrompt }: Props) {
  return (
    <View style={styles.container}>
      <LCMark size={32} color={Colors.textSecondary} accentColor={Colors.accent} />

      <View style={styles.textBlock}>
        <Text style={styles.heading}>Good to have you back, {MOCK_CLIENT.firstName}.</Text>
        <Text style={styles.sub}>
          Ask about your accounts, recent activity, or schedule time with {MOCK_CLIENT.advisorName}.
        </Text>
      </View>

      <View style={styles.prompts}>
        {SUGGESTED_PROMPTS.map((prompt) => (
          <TouchableOpacity
            key={prompt}
            style={styles.promptChip}
            onPress={() => onSelectPrompt(prompt)}
            activeOpacity={0.8}
            accessibilityRole="button"
            accessibilityLabel={prompt}
          >
            <Text style={styles.promptText}>{prompt}</Text>
          </TouchableOpacity>
        ))}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: Spacing.s6,
    gap: Spacing.s6,
  },
  textBlock: {
    alignItems: 'center',
    gap: Spacing.s2,
  },
  heading: {
    fontSize: FontSize.h2,
    fontWeight: FontWeight.medium,
    color: Colors.textPrimary,
    textAlign: 'center',
  },
  sub: {
    ...TypographyStyle.body,
    color: Colors.textSecondary,
    textAlign: 'center',
    lineHeight: 22,
  },
  prompts: {
    width: '100%',
    gap: Spacing.s2,
  },
  promptChip: {
    paddingVertical: Spacing.s3,
    paddingHorizontal: Spacing.s4,
    borderRadius: Radius.md,
    borderWidth: 1,
    borderColor: Colors.ruleDark,
    backgroundColor: Colors.surfaceElevated,
  },
  promptText: {
    ...TypographyStyle.body,
    color: Colors.textSecondary,
  },
});
