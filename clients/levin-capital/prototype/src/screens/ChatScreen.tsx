// ChatScreen — primary screen
// Renders message thread, handles keyboard avoidance, dispatches to useConversation

import React, { useRef, useCallback } from 'react';
import {
  View,
  FlatList,
  StyleSheet,
  KeyboardAvoidingView,
  Platform,
  SafeAreaView,
} from 'react-native';
import type { Message } from '../types';
import { Colors, Spacing } from '../constants/tokens';
import { useConversation } from '../hooks/useConversation';
import { ChatHeader } from '../components/chat/ChatHeader';
import { ChatInput } from '../components/chat/ChatInput';
import { MessageBubble } from '../components/chat/MessageBubble';
import { TimestampDivider } from '../components/chat/TimestampDivider';
import { EmptyState } from '../components/chat/EmptyState';
import { shouldShowTimestamp } from '../utils/format';

export function ChatScreen() {
  const { state, sendMessage, cancelToolCall, confirmSchedule, declineSchedule } = useConversation();
  const listRef = useRef<FlatList>(null);

  const scrollToBottom = useCallback(() => {
    if (state.messages.length > 0) {
      listRef.current?.scrollToEnd({ animated: true });
    }
  }, [state.messages.length]);

  function renderItem({ item, index }: { item: Message; index: number }) {
    const prev = state.messages[index - 1];
    const showTimestamp = shouldShowTimestamp(prev?.timestamp, item.timestamp);

    return (
      <>
        {showTimestamp && <TimestampDivider timestamp={item.timestamp} />}
        <MessageBubble
          message={item}
          onConfirmSchedule={confirmSchedule}
          onDeclineSchedule={declineSchedule}
        />
      </>
    );
  }

  const isEmpty = state.messages.length === 0;

  return (
    <SafeAreaView style={styles.safeArea} edges={['bottom']}>
      <View style={styles.screen}>
        <ChatHeader subtitle="Wealth Desk" />

        <KeyboardAvoidingView
          style={styles.flex}
          behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
          keyboardVerticalOffset={0}
        >
          {isEmpty ? (
            <EmptyState onSelectPrompt={sendMessage} />
          ) : (
            <FlatList
              ref={listRef}
              data={state.messages}
              keyExtractor={(item) => item.id}
              renderItem={renderItem}
              contentContainerStyle={styles.listContent}
              onContentSizeChange={scrollToBottom}
              onLayout={scrollToBottom}
              showsVerticalScrollIndicator={false}
              keyboardDismissMode="interactive"
              keyboardShouldPersistTaps="handled"
              maintainVisibleContentPosition={{ minIndexForVisible: 0 }}
            />
          )}

          <ChatInput
            onSend={sendMessage}
            onCancel={cancelToolCall}
            isLocked={state.activeTool !== null}
          />
        </KeyboardAvoidingView>
      </View>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: Colors.surfaceDark,
  },
  screen: {
    flex: 1,
    backgroundColor: Colors.surfaceDark,
  },
  flex: {
    flex: 1,
  },
  listContent: {
    paddingTop: Spacing.s4,
    paddingBottom: Spacing.s4,
  },
});
