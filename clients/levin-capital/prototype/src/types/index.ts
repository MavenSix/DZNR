// Levin Capital — core type definitions
// Based on Gibson Phase 1 conversation architecture

export type EscalationTier = 0 | 1 | 2 | 3;

export type MessageRole = 'user' | 'agent' | 'system';

// Inline card union — four types per Gibson spec
export type InlineCardData =
  | { type: 'account'; data: AccountCardData }
  | { type: 'transaction'; data: TransactionCardData }
  | { type: 'document'; data: DocumentCardData }
  | { type: 'schedule'; data: ScheduleCardData };

export type AccountCardData = {
  accountId: string;
  accountType: string;
  balance: number;
  performancePct: number;
  performanceAbs: number;
  period: string;
  asOf: string; // ISO8601
};

export type TransactionCardData = {
  id: string;
  amount: number;
  description: string;
  date: string;
  status: 'Pending' | 'Settled' | 'Failed';
  reference: string;
  accountId: string;
};

export type DocumentCardData = {
  documentId: string;
  name: string;
  date: string;
  fileType: string;
  fileSize: string;
};

export type AdvisorSlot = {
  id: string;
  display: string;
  iso: string;
};

export type ScheduleCardData = {
  advisorName: string;
  slots: AdvisorSlot[];
};

export type Message = {
  id: string;
  role: MessageRole;
  content: string;
  timestamp: string; // ISO8601
  inlineCard?: InlineCardData;
  isLoading?: boolean;
};

// Conversation state per Gibson architecture
export type ConversationState = {
  sessionId: string;
  clientId: string;
  messages: Message[];
  activeTool: string | null; // non-null while tool call in flight
  escalationTier: EscalationTier;
  pendingAdvisorSchedule: boolean;
  openCaseId: string | null;
};

// Navigation
export type RootStackParamList = {
  Chat: undefined;
  AccountSummary: { accountId: string; accountType: string };
};
