// MessageBubble — renders a single message in the thread
// User: right-aligned, surfaceElevated background
// Agent: left-aligned, surfaceOverlay background, 2px left border in accent (ledger line motif)
// Loading state: uses LedgerLine animated fill — not a bubble/spinner

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import type { Message } from '../../types';
import { Colors, Spacing, Radius, TypographyStyle } from '../../constants/tokens';
import { LedgerLine } from '../ui/LedgerLine';
import { AccountCard } from '../cards/AccountCard';
import { TransactionCard } from '../cards/TransactionCard';
import { DocumentCard } from '../cards/DocumentCard';
import { ScheduleCard } from '../cards/ScheduleCard';

type Props = {
  message: Message;
  onConfirmSchedule: (slotId: string) => void;
  onDeclineSchedule: () => void;
};

export function MessageBubble({ message, onConfirmSchedule, onDeclineSchedule }: Props) {
  const isUser = message.role === 'user';
  const isAgent = message.role === 'agent';

  if (message.isLoading) {
    // Agent loading state — ledger line fill only, no text
    return (
      <View style={[styles.row, styles.agentRow]}>
        <View style={styles.loadingContainer}>
          <LedgerLine active={true} height={2} />
        </View>
      </View>
    );
  }

  return (
    <View style={[styles.row, isUser ? styles.userRow : styles.agentRow]}>
      <View
        style={[
          styles.bubble,
          isUser ? styles.userBubble : styles.agentBubble,
        ]}
      >
        {message.content.length > 0 && (
          <Text style={isUser ? styles.userText : styles.agentText}>
            {message.content}
          </Text>
        )}

        {/* Inline card — rendered below message text */}
        {message.inlineCard && (
          <View style={styles.cardWrapper}>
            {message.inlineCard.type === 'account' && (
              <AccountCard data={message.inlineCard.data} />
            )}
            {message.inlineCard.type === 'transaction' && (
              <TransactionCard data={message.inlineCard.data} />
            )}
            {message.inlineCard.type === 'document' && (
              <DocumentCard data={message.inlineCard.data} />
            )}
            {message.inlineCard.type === 'schedule' && (
              <ScheduleCard
                data={message.inlineCard.data}
                onConfirm={onConfirmSchedule}
                onDecline={onDeclineSchedule}
              />
            )}
          </View>
        )}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  row: {
    paddingHorizontal: Spacing.s4,
    marginBottom: Spacing.s1,
  },
  userRow: {
    alignItems: 'flex-end',
  },
  agentRow: {
    alignItems: 'flex-start',
  },
  bubble: {
    maxWidth: '85%',
    borderRadius: Radius.lg,
    padding: Spacing.s4,
  },
  userBubble: {
    backgroundColor: Colors.surfaceElevated,
    borderWidth: 1,
    borderColor: Colors.ruleDark,
  },
  agentBubble: {
    backgroundColor: Colors.surfaceOverlay,
    borderLeftWidth: 2,
    borderLeftColor: Colors.accent,
    borderTopWidth: 0,
    borderRightWidth: 0,
    borderBottomWidth: 0,
    // Top-left radius: 4px (softened because of the left border motif)
    borderTopLeftRadius: Radius.sm,
    borderTopRightRadius: Radius.lg,
    borderBottomRightRadius: Radius.lg,
    borderBottomLeftRadius: Radius.sm,
  },
  userText: {
    ...TypographyStyle.body,
    color: Colors.textPrimary,
  },
  agentText: {
    ...TypographyStyle.body,
    color: Colors.textPrimary,
    lineHeight: 23,
  },
  cardWrapper: {
    marginTop: Spacing.s1,
  },
  loadingContainer: {
    width: 120,
    paddingVertical: Spacing.s4,
    paddingHorizontal: Spacing.s1,
  },
});
