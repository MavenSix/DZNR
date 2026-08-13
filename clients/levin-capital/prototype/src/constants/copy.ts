// Levin Capital microcopy constants
// Voice rules: precise, authoritative, restrained.
// No exclamation marks. No filler. Active voice.

export const Copy = {
  // Agent identity
  agentName: 'Levin Capital',
  inputPlaceholder: 'Ask about your portfolio...',

  // Loading
  agentTyping: '',  // ledger line only — no text label during tool call

  // Empty state
  emptyConversation: 'No messages yet.',
  emptyConversationCta: 'Ask about your accounts or portfolio.',

  // Input lock
  cancelToolCall: 'Cancel',

  // Timestamps
  today: 'Today',
  yesterday: 'Yesterday',

  // Account card
  accountCardAsOf: 'As of',
  accountCardPerformance: 'Performance',
  accountCardViewDetail: 'View full summary',

  // Transaction card
  txnStatusPending: 'Pending',
  txnStatusSettled: 'Settled',
  txnStatusFailed: 'Failed',
  txnSettles: 'Settles',
  txnRef: 'Ref',

  // Document card
  docDownload: 'Download',
  docView: 'View',

  // Schedule card
  scheduleConfirm: 'Confirm',
  scheduleDecline: 'Decline',
  scheduleWith: 'with',
  schedulePrepNote: 'Your advisor will receive a brief from this conversation.',

  // Escalation
  escalationNotice: 'This is a decision best made with your advisor.',
  escalationCta: 'Schedule a call',

  // Errors
  errorToolTimeout: 'Having trouble retrieving your account data. Try again, or your advisor team can pull this manually.',
  errorSessionExpired: 'Your session has expired. Please log in again.',
  errorDataNotFound: 'That information is not showing in your account. Want to open a case for review?',

  // Account summary screen
  accountSummaryTitle: 'Account Summary',
  backToChat: 'Back',

  // Support case
  caseCreated: 'A case has been opened.',
  caseRef: 'Case',
} as const;
