// LCMark — Levin Capital logomark
// The LC architectural corner mark in SVG.
// Used in chat header only — not in message bubbles.

import React from 'react';
import Svg, { Path, Rect } from 'react-native-svg';
import { Colors } from '../../constants/tokens';

type Props = {
  size?: number;
  color?: string;
  accentColor?: string;
};

export function LCMark({ size = 24, color = Colors.textPrimary, accentColor = Colors.accent }: Props) {
  // LC mark: L forms a right-angle corner, C opens right.
  // A hairline diagonal cut through the corner implies upward trajectory.
  return (
    <Svg width={size} height={size} viewBox="0 0 24 24" fill="none">
      {/* L — vertical stroke */}
      <Rect x="4" y="4" width="2.5" height="14" fill={color} />
      {/* L — horizontal base */}
      <Rect x="4" y="15.5" width="7" height="2.5" fill={color} />
      {/* Diagonal accent cut — the trajectory motif */}
      <Path
        d="M4.5 14.5 L11 7"
        stroke={accentColor}
        strokeWidth="1.5"
        strokeLinecap="square"
      />
      {/* C — arc represented as two strokes for legibility at small sizes */}
      <Rect x="13" y="4" width="7" height="2.5" fill={color} />
      <Rect x="13" y="17.5" width="7" height="2.5" fill={color} />
      <Rect x="13" y="4" width="2.5" height="16" fill={color} />
    </Svg>
  );
}
