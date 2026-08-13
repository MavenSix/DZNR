// ScheduleCard — inline message thread card
// Shows: advisor name, available slots, confirm/decline actions
// Per Gibson spec: on confirm, passes slotId up; on decline, removes card from context

import React, { useState } from 'react';
import { View, Text, TouchableOpacity, StyleSheet } from 'react-native';
import type { ScheduleCardData, AdvisorSlot } from '../../types';
import { Colors, Spacing, Radius, TypographyStyle, FontSize, FontWeight } from '../../constants/tokens';
import { Copy } from '../../constants/copy';

type Props = {
  data: ScheduleCardData;
  onConfirm: (slotId: string) => void;
  onDecline: () => void;
};

export function ScheduleCard({ data, onConfirm, onDecline }: Props) {
  const [selectedSlotId, setSelectedSlotId] = useState<string | null>(null);
  const [confirmed, setConfirmed] = useState(false);

  function handleConfirm() {
    if (!selectedSlotId) return;
    setConfirmed(true);
    onConfirm(selectedSlotId);
  }

  if (confirmed) {
    return (
      <View style={styles.container}>
        <View style={styles.topRule} />
        <View style={styles.inner}>
          <Text style={styles.confirmedText}>Scheduled.</Text>
          <Text style={styles.confirmedSub}>
            {Copy.schedulePrepNote}
          </Text>
        </View>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <View style={styles.topRule} />
      <View style={styles.inner}>
        {/* Advisor */}
        <Text style={styles.label}>
          {Copy.scheduleWith.toUpperCase()} · {data.advisorName.toUpperCase()}
        </Text>

        {/* Slot selector */}
        <View style={styles.slots}>
          {data.slots.map((slot: AdvisorSlot) => (
            <TouchableOpacity
              key={slot.id}
              style={[
                styles.slotBtn,
                selectedSlotId === slot.id && styles.slotBtnSelected,
              ]}
              onPress={() => setSelectedSlotId(slot.id)}
              activeOpacity={0.8}
              accessibilityRole="radio"
              accessibilityState={{ selected: selectedSlotId === slot.id }}
              accessibilityLabel={slot.display}
            >
              <Text
                style={[
                  styles.slotText,
                  selectedSlotId === slot.id && styles.slotTextSelected,
                ]}
              >
                {slot.display}
              </Text>
            </TouchableOpacity>
          ))}
        </View>

        {/* Prep note */}
        <Text style={styles.prepNote}>{Copy.schedulePrepNote}</Text>

        {/* Divider */}
        <View style={styles.rule} />

        {/* Actions */}
        <View style={styles.actions}>
          <TouchableOpacity
            style={[styles.confirmBtn, !selectedSlotId && styles.confirmBtnDisabled]}
            onPress={handleConfirm}
            disabled={!selectedSlotId}
            activeOpacity={0.8}
            accessibilityRole="button"
            accessibilityLabel="Confirm this schedule"
            accessibilityState={{ disabled: !selectedSlotId }}
          >
            <Text style={[styles.confirmText, !selectedSlotId && styles.confirmTextDisabled]}>
              {Copy.scheduleConfirm}
            </Text>
          </TouchableOpacity>

          <TouchableOpacity
            onPress={onDecline}
            activeOpacity={0.7}
            accessibilityRole="button"
            accessibilityLabel="Decline schedule"
            style={styles.declineBtn}
          >
            <Text style={styles.declineText}>{Copy.scheduleDecline}</Text>
          </TouchableOpacity>
        </View>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    backgroundColor: Colors.surfaceElevated,
    borderRadius: Radius.lg,
    borderWidth: 1,
    borderColor: Colors.ruleDark,
    marginTop: Spacing.s2,
    overflow: 'hidden',
  },
  topRule: {
    height: 2,
    backgroundColor: Colors.accent,
  },
  inner: {
    padding: Spacing.s4,
    gap: Spacing.s3,
  },
  label: {
    ...TypographyStyle.label,
  },
  slots: {
    gap: Spacing.s2,
  },
  slotBtn: {
    paddingVertical: Spacing.s3,
    paddingHorizontal: Spacing.s4,
    borderRadius: Radius.md,
    borderWidth: 1,
    borderColor: Colors.ruleDark,
    backgroundColor: Colors.surfaceOverlay,
  },
  slotBtnSelected: {
    borderColor: Colors.accent,
    backgroundColor: Colors.surfaceOverlay,
  },
  slotText: {
    ...TypographyStyle.body,
    color: Colors.textSecondary,
  },
  slotTextSelected: {
    color: Colors.accent,
    fontWeight: FontWeight.medium,
  },
  prepNote: {
    ...TypographyStyle.bodySm,
    fontSize: 12,
  },
  rule: {
    height: 1,
    backgroundColor: Colors.ruleDark,
  },
  actions: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.s4,
  },
  confirmBtn: {
    paddingVertical: Spacing.s2,
    paddingHorizontal: Spacing.s5,
    borderRadius: Radius.sm,
    backgroundColor: Colors.accent,
  },
  confirmBtnDisabled: {
    backgroundColor: Colors.surfaceOverlay,
  },
  confirmText: {
    fontSize: FontSize.body,
    fontWeight: FontWeight.semibold,
    color: Colors.surfaceDark,
  },
  confirmTextDisabled: {
    color: Colors.textSecondary,
  },
  declineBtn: {
    paddingVertical: Spacing.s2,
  },
  declineText: {
    ...TypographyStyle.body,
    color: Colors.textSecondary,
  },
  confirmedText: {
    ...TypographyStyle.h3,
    color: Colors.success,
  },
  confirmedSub: {
    ...TypographyStyle.bodySm,
  },
});
