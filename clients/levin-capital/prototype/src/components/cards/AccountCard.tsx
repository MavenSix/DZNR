// AccountCard — inline message thread card
// Shows: account type, balance, performance delta, as-of timestamp
// Tappable: navigates to AccountSummary screen

import React from 'react';
import {
  View,
  Text,
  TouchableOpacity,
  StyleSheet,
} from 'react-native';
import { useNavigation } from '@react-navigation/native';
import type { NativeStackNavigationProp } from '@react-navigation/native-stack';
import type { RootStackParamList, AccountCardData } from '../../types';
import { Colors, Spacing, Radius, TypographyStyle, FontSize, FontWeight } from '../../constants/tokens';
import { Copy } from '../../constants/copy';
import { formatCurrency, formatPercent, formatAsOf } from '../../utils/format';

type Props = {
  data: AccountCardData;
};

export function AccountCard({ data }: Props) {
  const navigation = useNavigation<NativeStackNavigationProp<RootStackParamList>>();
  const isPositive = data.performancePct >= 0;

  return (
    <TouchableOpacity
      style={styles.container}
      onPress={() =>
        navigation.navigate('AccountSummary', {
          accountId: data.accountId,
          accountType: data.accountType,
        })
      }
      activeOpacity={0.85}
      accessibilityRole="button"
      accessibilityLabel={`View ${data.accountType} account summary`}
    >
      {/* Top rule — ledger line motif at card level */}
      <View style={styles.topRule} />

      <View style={styles.inner}>
        {/* Label row */}
        <View style={styles.labelRow}>
          <Text style={styles.accountType}>{data.accountType.toUpperCase()}</Text>
          <Text style={styles.asOf}>
            {Copy.accountCardAsOf} {formatAsOf(data.asOf)}
          </Text>
        </View>

        {/* Balance */}
        <Text style={styles.balance}>{formatCurrency(data.balance)}</Text>

        {/* Performance */}
        <View style={styles.perfRow}>
          <Text style={[styles.perfPct, { color: isPositive ? Colors.success : Colors.error }]}>
            {isPositive ? '+' : ''}{formatPercent(data.performancePct)}
          </Text>
          <Text style={styles.perfSep}> · </Text>
          <Text style={[styles.perfAbs, { color: isPositive ? Colors.success : Colors.error }]}>
            {isPositive ? '+' : ''}{formatCurrency(data.performanceAbs)}
          </Text>
          <Text style={styles.period}> {data.period}</Text>
        </View>

        {/* Chevron hint */}
        <Text style={styles.viewDetail}>{Copy.accountCardViewDetail} →</Text>
      </View>
    </TouchableOpacity>
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
    width: '100%',
  },
  inner: {
    padding: Spacing.s4,
    gap: Spacing.s2,
  },
  labelRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  accountType: {
    ...TypographyStyle.label,
  },
  asOf: {
    ...TypographyStyle.bodySm,
    fontSize: 11,
  },
  balance: {
    fontSize: FontSize.h1,
    fontWeight: FontWeight.semibold,
    color: Colors.textPrimary,
    fontVariant: ['tabular-nums'],
    letterSpacing: -0.5,
  },
  perfRow: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  perfPct: {
    fontSize: FontSize.body,
    fontWeight: FontWeight.medium,
    fontVariant: ['tabular-nums'],
  },
  perfSep: {
    ...TypographyStyle.bodySm,
  },
  perfAbs: {
    fontSize: FontSize.body,
    fontWeight: FontWeight.regular,
    fontVariant: ['tabular-nums'],
  },
  period: {
    ...TypographyStyle.bodySm,
  },
  viewDetail: {
    ...TypographyStyle.bodySm,
    color: Colors.accent,
    marginTop: Spacing.s1,
  },
});
