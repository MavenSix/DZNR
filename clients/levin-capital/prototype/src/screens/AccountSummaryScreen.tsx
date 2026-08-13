// AccountSummaryScreen — navigated to from AccountCard tap
// Shows full account breakdown: balance, allocation, performance by period

import React from 'react';
import {
  View,
  Text,
  ScrollView,
  TouchableOpacity,
  StyleSheet,
  SafeAreaView,
  Platform,
} from 'react-native';
import type { NativeStackScreenProps } from '@react-navigation/native-stack';
import type { RootStackParamList } from '../types';
import { Colors, Spacing, Radius, TypographyStyle, FontSize, FontWeight } from '../constants/tokens';
import { MOCK_ACCOUNT_SUMMARY } from '../mock/data';
import { formatCurrency, formatPercent } from '../utils/format';

type Props = NativeStackScreenProps<RootStackParamList, 'AccountSummary'>;

function AllocationBar({ slices }: { slices: { label: string; pct: number }[] }) {
  const colors = [Colors.accent, Colors.success, Colors.textSecondary, Colors.error];
  return (
    <View style={styles.allocBarContainer}>
      <View style={styles.allocBar}>
        {slices.map((slice, i) => (
          <View
            key={slice.label}
            style={[
              styles.allocBarSlice,
              {
                flex: slice.pct,
                backgroundColor: colors[i % colors.length],
              },
            ]}
          />
        ))}
      </View>
      <View style={styles.allocLegend}>
        {slices.map((slice, i) => (
          <View key={slice.label} style={styles.allocLegendItem}>
            <View style={[styles.allocDot, { backgroundColor: colors[i % colors.length] }]} />
            <Text style={styles.allocLabel}>{slice.label}</Text>
            <Text style={styles.allocPct}>{slice.pct.toFixed(1)}%</Text>
          </View>
        ))}
      </View>
    </View>
  );
}

export function AccountSummaryScreen({ route, navigation }: Props) {
  const { accountId, accountType } = route.params;

  // Find the account — fall back to first if "all" or not found
  const account =
    accountId === 'all'
      ? null
      : MOCK_ACCOUNT_SUMMARY.accounts.find((a) => a.id === accountId) ??
        MOCK_ACCOUNT_SUMMARY.accounts[0];

  const isPositive = account ? account.performancePct >= 0 : true;
  const asOf = new Date().toLocaleString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric',
    hour: 'numeric',
    minute: '2-digit',
    timeZoneName: 'short',
  });

  return (
    <SafeAreaView style={styles.safeArea}>
      {/* Custom nav header */}
      <View style={styles.navHeader}>
        <TouchableOpacity
          onPress={() => navigation.goBack()}
          activeOpacity={0.7}
          accessibilityRole="button"
          accessibilityLabel="Back to chat"
          style={styles.backBtn}
        >
          <Text style={styles.backText}>← Back</Text>
        </TouchableOpacity>
        <Text style={styles.navTitle}>{accountType}</Text>
        <View style={styles.navSpacer} />
      </View>
      <View style={styles.headerRule} />

      <ScrollView
        style={styles.scroll}
        contentContainerStyle={styles.scrollContent}
        showsVerticalScrollIndicator={false}
      >
        {account ? (
          <>
            {/* Balance block */}
            <View style={styles.section}>
              <Text style={styles.sectionLabel}>BALANCE</Text>
              <Text style={styles.balanceDisplay}>{formatCurrency(account.balance)}</Text>
              <View style={styles.perfRow}>
                <Text style={[styles.perfPct, { color: isPositive ? Colors.success : Colors.error }]}>
                  {isPositive ? '+' : ''}{formatPercent(account.performancePct)}
                </Text>
                <Text style={styles.perfSep}> · </Text>
                <Text style={[styles.perfAbs, { color: isPositive ? Colors.success : Colors.error }]}>
                  {isPositive ? '+' : ''}{formatCurrency(account.performanceAbs)}
                </Text>
                <Text style={styles.perfPeriod}> {account.period}</Text>
              </View>
              <Text style={styles.asOf}>As of {asOf}</Text>
            </View>

            <View style={styles.rule} />

            {/* Allocation */}
            <View style={styles.section}>
              <Text style={styles.sectionLabel}>ALLOCATION</Text>
              <AllocationBar slices={account.allocation} />
            </View>

            <View style={styles.rule} />

            {/* Performance table */}
            <View style={styles.section}>
              <Text style={styles.sectionLabel}>PERFORMANCE</Text>
              {[
                { period: 'MTD', pct: 0.43 },
                { period: 'QTD', pct: 1.87 },
                { period: 'YTD', pct: account.performancePct },
                { period: '1 Year', pct: 7.21 },
                { period: '3 Year', pct: 22.14 },
              ].map((row, i) => {
                const pos = row.pct >= 0;
                return (
                  <View key={row.period} style={[styles.perfTableRow, i > 0 && styles.perfTableRowBorder]}>
                    <Text style={styles.perfTableLabel}>{row.period}</Text>
                    <Text style={[styles.perfTableValue, { color: pos ? Colors.success : Colors.error }]}>
                      {pos ? '+' : ''}{formatPercent(row.pct)}
                    </Text>
                  </View>
                );
              })}
            </View>
          </>
        ) : (
          // "All accounts" summary
          <View style={styles.section}>
            <Text style={styles.sectionLabel}>TOTAL ASSETS UNDER MANAGEMENT</Text>
            <Text style={styles.balanceDisplay}>{formatCurrency(MOCK_ACCOUNT_SUMMARY.totalAUM)}</Text>
            <Text style={styles.asOf}>As of {asOf}</Text>
            <View style={styles.rule} />
            {MOCK_ACCOUNT_SUMMARY.accounts.map((a, i) => (
              <View key={a.id} style={[styles.acctRow, i > 0 && styles.acctRowBorder]}>
                <Text style={styles.acctType}>{a.type}</Text>
                <Text style={styles.acctBalance}>{formatCurrency(a.balance)}</Text>
              </View>
            ))}
          </View>
        )}
      </ScrollView>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  safeArea: {
    flex: 1,
    backgroundColor: Colors.surfaceDark,
  },
  navHeader: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: Spacing.s5,
    paddingTop: Platform.OS === 'ios' ? Spacing.s4 : Spacing.s4,
    paddingBottom: Spacing.s4,
  },
  backBtn: {
    minWidth: 64,
  },
  backText: {
    ...TypographyStyle.body,
    color: Colors.accent,
  },
  navTitle: {
    flex: 1,
    textAlign: 'center',
    fontSize: FontSize.h3,
    fontWeight: FontWeight.medium,
    color: Colors.textPrimary,
  },
  navSpacer: {
    minWidth: 64,
  },
  headerRule: {
    height: 1,
    backgroundColor: Colors.ruleDark,
  },
  scroll: {
    flex: 1,
  },
  scrollContent: {
    padding: Spacing.s5,
    gap: Spacing.s4,
    paddingBottom: Spacing.s12,
  },
  section: {
    gap: Spacing.s3,
  },
  sectionLabel: {
    ...TypographyStyle.label,
  },
  balanceDisplay: {
    fontSize: FontSize.display,
    fontWeight: FontWeight.semibold,
    color: Colors.textPrimary,
    fontVariant: ['tabular-nums'],
    letterSpacing: -1,
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
    fontVariant: ['tabular-nums'],
  },
  perfPeriod: {
    ...TypographyStyle.bodySm,
  },
  asOf: {
    ...TypographyStyle.bodySm,
  },
  rule: {
    height: 1,
    backgroundColor: Colors.ruleDark,
    marginVertical: Spacing.s2,
  },
  allocBarContainer: {
    gap: Spacing.s3,
  },
  allocBar: {
    flexDirection: 'row',
    height: 6,
    borderRadius: Radius.full,
    overflow: 'hidden',
    gap: 1,
  },
  allocBarSlice: {
    borderRadius: 0,
  },
  allocLegend: {
    gap: Spacing.s2,
  },
  allocLegendItem: {
    flexDirection: 'row',
    alignItems: 'center',
    gap: Spacing.s2,
  },
  allocDot: {
    width: 8,
    height: 8,
    borderRadius: 4,
  },
  allocLabel: {
    ...TypographyStyle.body,
    flex: 1,
  },
  allocPct: {
    fontSize: FontSize.body,
    fontVariant: ['tabular-nums'],
    color: Colors.textSecondary,
    fontWeight: FontWeight.medium,
  },
  perfTableRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: Spacing.s3,
  },
  perfTableRowBorder: {
    borderTopWidth: 1,
    borderTopColor: Colors.ruleDark,
  },
  perfTableLabel: {
    ...TypographyStyle.body,
    color: Colors.textSecondary,
  },
  perfTableValue: {
    fontSize: FontSize.body,
    fontWeight: FontWeight.medium,
    fontVariant: ['tabular-nums'],
  },
  acctRow: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    paddingVertical: Spacing.s3,
  },
  acctRowBorder: {
    borderTopWidth: 1,
    borderTopColor: Colors.ruleDark,
  },
  acctType: {
    ...TypographyStyle.body,
  },
  acctBalance: {
    fontSize: FontSize.body,
    fontWeight: FontWeight.medium,
    fontVariant: ['tabular-nums'],
    color: Colors.textPrimary,
  },
});
