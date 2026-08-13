// Levin Capital Design Token System
// Source: Snape Phase 1 brand output
// Do not override these values inline — update tokens here only.

export const Colors = {
  // Surfaces
  surfaceDark: '#0D1B2A',
  surfaceElevated: '#162233',
  surfaceOverlay: '#1E2E42',

  // Text
  textPrimary: '#F5F1EB',
  textSecondary: '#9AA5B1',

  // Brand accent
  accent: '#C9A84C',
  accentDim: '#B8943F',

  // Rules / borders
  ruleDark: '#243447',

  // Semantic
  success: '#3D9970',
  error: '#C0392B',
  warning: '#C9A84C', // shares accent intentionally

  // Ink / ivory (light mode seeds — not used in dark prototype)
  ink: '#0D1B2A',
  ivory: '#F5F1EB',
} as const;

export const Spacing = {
  s1: 4,
  s2: 8,
  s3: 12,
  s4: 16,
  s5: 20,
  s6: 24,
  s8: 32,
  s10: 40,
  s12: 48,
} as const;

export const Radius = {
  sm: 4,
  md: 8,
  lg: 12,
  xl: 16,
  full: 9999,
} as const;

export const FontSize = {
  display: 32,
  h1: 24,
  h2: 20,
  h3: 17,
  body: 15,
  bodySm: 13,
  label: 11,
  mono: 13,
} as const;

export const FontWeight = {
  regular: '400' as const,
  medium: '500' as const,
  semibold: '600' as const,
};

// Z-index scale — fixed, no arbitrary values
export const ZIndex = {
  base: 0,
  raised: 10,
  overlay: 20,
  modal: 30,
  toast: 40,
} as const;

// Typography helpers
export const TypographyStyle = {
  display: {
    fontSize: FontSize.display,
    fontWeight: FontWeight.semibold,
    color: Colors.textPrimary,
    letterSpacing: -0.5,
  },
  h1: {
    fontSize: FontSize.h1,
    fontWeight: FontWeight.semibold,
    color: Colors.textPrimary,
    letterSpacing: -0.3,
  },
  h2: {
    fontSize: FontSize.h2,
    fontWeight: FontWeight.medium,
    color: Colors.textPrimary,
    letterSpacing: -0.2,
  },
  h3: {
    fontSize: FontSize.h3,
    fontWeight: FontWeight.medium,
    color: Colors.textPrimary,
  },
  body: {
    fontSize: FontSize.body,
    fontWeight: FontWeight.regular,
    color: Colors.textPrimary,
    lineHeight: 22,
  },
  bodySm: {
    fontSize: FontSize.bodySm,
    fontWeight: FontWeight.regular,
    color: Colors.textSecondary,
    lineHeight: 18,
  },
  label: {
    fontSize: FontSize.label,
    fontWeight: FontWeight.medium,
    color: Colors.textSecondary,
    letterSpacing: 0.8,
    textTransform: 'uppercase' as const,
  },
  mono: {
    fontSize: FontSize.mono,
    fontFamily: 'monospace' as const,
    fontVariant: ['tabular-nums'] as any,
    color: Colors.textPrimary,
  },
} as const;
