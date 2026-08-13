// ChatInput — message composition bar
// Per Snape spec:
//   - radius-xl pill when empty, radius-lg when text is entered
//   - placeholder: "Ask about your portfolio..."
//   - send: inactive until text, active uses accent color
//   - input lock: disabled + stop icon during tool call; client can cancel

import React, { useState, useCallback } from 'react';
import {
  View,
  TextInput,
  TouchableOpacity,
  StyleSheet,
  Platform,
} from 'react-native';
import { Colors, Spacing, Radius, FontSize, FontWeight } from '../../constants/tokens';
import { Copy } from '../../constants/copy';
import Svg, { Path, Rect } from 'react-native-svg';

function SendIcon({ color }: { color: string }) {
  return (
    <Svg width={18} height={18} viewBox="0 0 24 24" fill="none">
      <Path
        d="M5 12h14M13 6l6 6-6 6"
        stroke={color}
        strokeWidth={2}
        strokeLinecap="square"
        strokeLinejoin="miter"
      />
    </Svg>
  );
}

function StopIcon({ color }: { color: string }) {
  return (
    <Svg width={16} height={16} viewBox="0 0 24 24" fill="none">
      <Rect x="5" y="5" width="14" height="14" fill={color} rx={2} />
    </Svg>
  );
}

type Props = {
  onSend: (text: string) => void;
  onCancel: () => void;
  isLocked: boolean; // true while tool call in flight
};

export function ChatInput({ onSend, onCancel, isLocked }: Props) {
  const [text, setText] = useState('');
  const hasText = text.trim().length > 0;

  const handleSend = useCallback(() => {
    if (!hasText || isLocked) return;
    onSend(text.trim());
    setText('');
  }, [text, hasText, isLocked, onSend]);

  const borderRadius = hasText ? Radius.lg : Radius.xl;

  return (
    <View style={styles.container}>
      <View style={[styles.inputRow, { borderRadius }]}>
        <TextInput
          style={[styles.input, { borderRadius }]}
          value={text}
          onChangeText={setText}
          placeholder={Copy.inputPlaceholder}
          placeholderTextColor={Colors.textSecondary}
          multiline
          maxLength={500}
          editable={!isLocked}
          onSubmitEditing={Platform.OS === 'ios' ? undefined : handleSend}
          returnKeyType="send"
          accessibilityLabel="Message input"
          accessibilityHint="Type a message to the Levin Capital desk"
        />

        {isLocked ? (
          // Stop button — cancel the in-flight tool call
          <TouchableOpacity
            style={[styles.actionBtn, styles.stopBtn]}
            onPress={onCancel}
            activeOpacity={0.8}
            accessibilityRole="button"
            accessibilityLabel={Copy.cancelToolCall}
          >
            <StopIcon color={Colors.surfaceDark} />
          </TouchableOpacity>
        ) : (
          // Send button — inactive until text present
          <TouchableOpacity
            style={[
              styles.actionBtn,
              hasText ? styles.sendBtnActive : styles.sendBtnInactive,
            ]}
            onPress={handleSend}
            disabled={!hasText}
            activeOpacity={0.8}
            accessibilityRole="button"
            accessibilityLabel="Send message"
            accessibilityState={{ disabled: !hasText }}
          >
            <SendIcon color={hasText ? Colors.surfaceDark : Colors.textSecondary} />
          </TouchableOpacity>
        )}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    paddingHorizontal: Spacing.s4,
    paddingVertical: Spacing.s3,
    backgroundColor: Colors.surfaceElevated,
    borderTopWidth: 1,
    borderTopColor: Colors.ruleDark,
  },
  inputRow: {
    flexDirection: 'row',
    alignItems: 'flex-end',
    backgroundColor: Colors.surfaceOverlay,
    borderWidth: 1,
    borderColor: Colors.ruleDark,
    paddingLeft: Spacing.s4,
    paddingRight: Spacing.s2,
    paddingVertical: Spacing.s2,
    gap: Spacing.s2,
  },
  input: {
    flex: 1,
    fontSize: FontSize.body,
    color: Colors.textPrimary,
    minHeight: 36,
    maxHeight: 120,
    paddingTop: Platform.OS === 'ios' ? 8 : 0,
    paddingBottom: Platform.OS === 'ios' ? 8 : 0,
  },
  actionBtn: {
    width: 36,
    height: 36,
    borderRadius: Radius.full,
    alignItems: 'center',
    justifyContent: 'center',
    flexShrink: 0,
  },
  sendBtnActive: {
    backgroundColor: Colors.accent,
  },
  sendBtnInactive: {
    backgroundColor: Colors.surfaceElevated,
  },
  stopBtn: {
    backgroundColor: Colors.error,
  },
});
