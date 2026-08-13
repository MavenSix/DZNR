// TransactionCard — inline message thread card
// Shows: amount, description, date, status, reference number

import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import type { TransactionCardData } from '../../types';
import { Colors, Spacing, Radius, TypographyStyle, FontSize, FontWeight } from '../../constants/tokens';
import { Copy } from '../../constants/copy';
import { formatCurrency, formatDate } from '../../utils/format';

type Props = {
  data: TransactionCardData;
};

const STATUS_COLOR: Record<TransactionCardData['status'], string> = {
  Settled: Colors.success,
  Pending: Colors.accent,
  Failed: Colors.error,
};

export function TransactionCard({ data }: Props) {
  const isCredit = data.amount > 0;
  const statusColor = STATUS_COLOR[data.status];

  return (
    <View style={styles.container}>
      <View style={styles.topRule} />
      <View style={styles.inner}>
        {/* Header row */}
        <View style={styles.headerRow}>
          <Text style={styles.description} numberOfLines={1}>{data.description}</Text>
          <Text style={[styles.amount, { color: isCredit ? Colors.success : Colors.textPrimary }]}>
            {isCredit ? '+' : ''}{formatCurrency(data.amount)}
          </Text>
        </View>

        {/* Meta row */}
        <View style={styles.metaRow}>
          <Text style={styles.date}>{formatDate(data.date)}</Text>
          <View style={styles.statusChip}>
            <View style={[styles.statusDot, { backgroundColor: statusColor }]} />
            <Text style={[styles.statusText, { color: statusColor }]}>{data.status}</Text>
          </View>
        </View>

        {/* Divider */}
        <View style={styles.rule} />

        {/* Reference */}
        <Text style={styles.reference}>
          {Copy.txnRef}: <Text style={styles.referenceValue}>{data.reference}</Text>
        </Text>
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
    gap: Spacing.s2,
  },
  headerRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'flex-start',
    gap: Spacing.s3,
  },
  description: {
    ...TypographyStyle.body,
    flex: 1,
  },
  amount: {
    fontSize: FontSize.h3,
    fontWeight: FontWeight.semibold,
    fontVariant: ['tabular-nums'],
    color: Colors.textPrimary,
  },
  metaRow: {
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
  },
  date: {
    ...TypographyStyle.bodySm,
  },
  statusChip: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.s1,
  },
  statusDot: {
    width: 6,
    height: 6,
    borderRadius: 3,
  },
  statusText: {
    fontSize: 12,
    fontWeight: FontWeight.medium,
  },
  rule: {
    height: 1,
    backgroundColor: Colors.ruleDark,
    marginVertical: Spacing.s1,
  },
  reference: {
    ...TypographyStyle.bodySm,
  },
  referenceValue: {
    fontFamily: 'monospace',
    color: Colors.textSecondary,
    fontSize: 11,
  },
});
