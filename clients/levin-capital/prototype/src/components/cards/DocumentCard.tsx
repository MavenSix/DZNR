// DocumentCard — inline message thread card
// Shows: document name, date, file type, size, view/download action

import React, { useState } from 'react';
import { View, Text, TouchableOpacity, StyleSheet, Alert } from 'react-native';
import type { DocumentCardData } from '../../types';
import { Colors, Spacing, Radius, TypographyStyle, FontSize, FontWeight } from '../../constants/tokens';
import { Copy } from '../../constants/copy';
import { formatDate } from '../../utils/format';

type Props = {
  data: DocumentCardData;
};

export function DocumentCard({ data }: Props) {
  const [downloading, setDownloading] = useState(false);

  function handleDownload() {
    // Prototype: simulate download
    setDownloading(true);
    setTimeout(() => {
      setDownloading(false);
      Alert.alert('Document ready', `${data.name} has been prepared for download.`);
    }, 1200);
  }

  return (
    <View style={styles.container}>
      <View style={styles.topRule} />
      <View style={styles.inner}>
        {/* Icon + name */}
        <View style={styles.nameRow}>
          <View style={styles.fileTypeChip}>
            <Text style={styles.fileTypeText}>{data.fileType}</Text>
          </View>
          <Text style={styles.docName} numberOfLines={2}>{data.name}</Text>
        </View>

        {/* Meta */}
        <View style={styles.metaRow}>
          <Text style={styles.meta}>{formatDate(data.date)}</Text>
          <Text style={styles.metaSep}> · </Text>
          <Text style={styles.meta}>{data.fileSize}</Text>
        </View>

        {/* Divider */}
        <View style={styles.rule} />

        {/* Action */}
        <TouchableOpacity
          style={styles.downloadBtn}
          onPress={handleDownload}
          disabled={downloading}
          activeOpacity={0.75}
          accessibilityRole="button"
          accessibilityLabel={`Download ${data.name}`}
        >
          <Text style={[styles.downloadText, downloading && styles.downloadingText]}>
            {downloading ? 'Preparing...' : Copy.docDownload}
          </Text>
        </TouchableOpacity>
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
  nameRow: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    gap: Spacing.s3,
  },
  fileTypeChip: {
    backgroundColor: Colors.surfaceOverlay,
    borderRadius: Radius.sm,
    paddingHorizontal: Spacing.s2,
    paddingVertical: 3,
  },
  fileTypeText: {
    fontSize: 10,
    fontWeight: FontWeight.semibold,
    color: Colors.accent,
    letterSpacing: 0.5,
  },
  docName: {
    ...TypographyStyle.h3,
    flex: 1,
    lineHeight: 22,
  },
  metaRow: {
    flexDirection: 'row',
    alignItems: 'center',
  },
  meta: {
    ...TypographyStyle.bodySm,
  },
  metaSep: {
    ...TypographyStyle.bodySm,
  },
  rule: {
    height: 1,
    backgroundColor: Colors.ruleDark,
    marginVertical: Spacing.s1,
  },
  downloadBtn: {
    paddingVertical: Spacing.s2,
  },
  downloadText: {
    fontSize: FontSize.body,
    fontWeight: FontWeight.medium,
    color: Colors.accent,
  },
  downloadingText: {
    color: Colors.textSecondary,
  },
});
