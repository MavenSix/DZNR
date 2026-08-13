// Mock data for prototype interactions
// Realistic, organic values — no predictable round numbers

import type { Message, InlineCardData } from '../types';

export const MOCK_CLIENT = {
  id: 'client_8821',
  firstName: 'Marcus',
  tier: 'Priority' as const,
  advisorName: 'Claire Hartwell',
  advisorId: 'adv_0047',
  accounts: [
    { id: 'acct_growth_1', type: 'Growth Portfolio', label: 'Growth Portfolio' },
    { id: 'acct_income_2', type: 'Income Portfolio', label: 'Income Portfolio' },
    { id: 'acct_roth_3', type: 'Roth IRA', label: 'Roth IRA' },
  ],
};

export const MOCK_ACCOUNT_SUMMARY = {
  totalAUM: 1_847_392.14,
  asOf: new Date().toISOString(),
  accounts: [
    {
      id: 'acct_growth_1',
      type: 'Growth Portfolio',
      balance: 1_203_847.55,
      performancePct: 4.73,
      performanceAbs: 54_621.18,
      period: 'YTD',
      allocation: [
        { label: 'Equities', pct: 68.2 },
        { label: 'Fixed Income', pct: 18.4 },
        { label: 'Alternatives', pct: 8.9 },
        { label: 'Cash', pct: 4.5 },
      ],
    },
    {
      id: 'acct_income_2',
      type: 'Income Portfolio',
      balance: 512_441.80,
      performancePct: 2.17,
      performanceAbs: 10_894.63,
      period: 'YTD',
      allocation: [
        { label: 'Fixed Income', pct: 72.1 },
        { label: 'Equities', pct: 18.3 },
        { label: 'Cash', pct: 9.6 },
      ],
    },
    {
      id: 'acct_roth_3',
      type: 'Roth IRA',
      balance: 131_102.79,
      performancePct: 6.41,
      performanceAbs: 7_894.31,
      period: 'YTD',
      allocation: [
        { label: 'Equities', pct: 91.4 },
        { label: 'Cash', pct: 8.6 },
      ],
    },
  ],
};

export const MOCK_TRANSACTIONS = [
  {
    id: 'txn_8821_001',
    amount: -12_500.00,
    description: 'Advisory fee — Q1 2026',
    date: '2026-04-03',
    status: 'Settled' as const,
    reference: 'LC-2026-Q1-0047',
    accountId: 'acct_growth_1',
  },
  {
    id: 'txn_8821_002',
    amount: 75_000.00,
    description: 'Wire deposit',
    date: '2026-04-28',
    status: 'Settled' as const,
    reference: 'LC-WD-20260428-1193',
    accountId: 'acct_growth_1',
  },
  {
    id: 'txn_8821_003',
    amount: -3_847.22,
    description: 'Dividend reinvestment',
    date: '2026-05-15',
    status: 'Settled' as const,
    reference: 'LC-DIV-20260515-0092',
    accountId: 'acct_income_2',
  },
  {
    id: 'txn_8821_004',
    amount: 25_000.00,
    description: 'IRA contribution 2026',
    date: '2026-05-22',
    status: 'Pending' as const,
    reference: 'LC-IRA-20260522-0017',
    accountId: 'acct_roth_3',
  },
];

export const MOCK_ADVISOR_SLOTS = [
  { id: 'slot_1', display: 'Thu, May 29 at 10:00 AM ET', iso: '2026-05-29T10:00:00-04:00' },
  { id: 'slot_2', display: 'Fri, May 30 at 2:00 PM ET', iso: '2026-05-30T14:00:00-04:00' },
  { id: 'slot_3', display: 'Mon, Jun 2 at 9:30 AM ET', iso: '2026-06-02T09:30:00-04:00' },
];

// Mock agent response map: triggers → response objects
export type MockTrigger =
  | 'balance'
  | 'portfolio'
  | 'transfer'
  | 'transaction'
  | 'statement'
  | 'schedule'
  | 'invest'
  | 'tax'
  | 'default';

export type MockResponse = {
  text: string;
  toolDelay: number; // ms to simulate tool call
  inlineCard?: InlineCardData;
};

export const MOCK_RESPONSES: Record<MockTrigger, MockResponse> = {
  balance: {
    text: `Your total assets under management are $1,847,392.14, as of ${new Date().toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit', timeZoneName: 'short' })} today. The figure spans three accounts.`,
    toolDelay: 1800,
    inlineCard: {
      type: 'account',
      data: {
        accountType: 'Total Portfolio',
        balance: 1_847_392.14,
        performancePct: 4.12,
        performanceAbs: 72_410.12,
        period: 'YTD',
        asOf: new Date().toISOString(),
        accountId: 'all',
      },
    },
  },
  portfolio: {
    text: 'Your Growth Portfolio is your largest position. YTD performance is +4.73%, driven primarily by the equities allocation.',
    toolDelay: 2100,
    inlineCard: {
      type: 'account',
      data: {
        accountType: 'Growth Portfolio',
        balance: 1_203_847.55,
        performancePct: 4.73,
        performanceAbs: 54_621.18,
        period: 'YTD',
        asOf: new Date().toISOString(),
        accountId: 'acct_growth_1',
      },
    },
  },
  transfer: {
    text: 'Your most recent wire deposit of $75,000 settled on April 28. There is one pending transaction: an IRA contribution of $25,000 from May 22.',
    toolDelay: 1600,
    inlineCard: {
      type: 'transaction',
      data: MOCK_TRANSACTIONS[3],
    },
  },
  transaction: {
    text: 'Here is the most recent activity on your account.',
    toolDelay: 1600,
    inlineCard: {
      type: 'transaction',
      data: MOCK_TRANSACTIONS[1],
    },
  },
  statement: {
    text: 'Your Q1 2026 statement is available. It covers the period January 1 through March 31.',
    toolDelay: 1400,
    inlineCard: {
      type: 'document',
      data: {
        name: 'Q1 2026 Account Statement',
        date: '2026-04-05',
        fileType: 'PDF',
        fileSize: '284 KB',
        documentId: 'doc_q1_2026_stmt',
      },
    },
  },
  schedule: {
    text: `Claire Hartwell has availability later this week and early next. I can confirm a time on your behalf.`,
    toolDelay: 1200,
    inlineCard: {
      type: 'schedule',
      data: {
        advisorName: 'Claire Hartwell',
        slots: MOCK_ADVISOR_SLOTS.slice(0, 3),
      },
    },
  },
  invest: {
    text: `That's a decision best made with your advisor. Investment recommendations above a certain threshold require a direct conversation with Claire Hartwell. She has availability this week.`,
    toolDelay: 800,
    inlineCard: {
      type: 'schedule',
      data: {
        advisorName: 'Claire Hartwell',
        slots: MOCK_ADVISOR_SLOTS.slice(0, 2),
      },
    },
  },
  tax: {
    text: 'Tax strategy falls outside what I can advise on directly. Your advisor coordinates with Levin Capital\'s tax planning partners. Want me to schedule a conversation with Claire Hartwell?',
    toolDelay: 600,
  },
  default: {
    text: 'I can help with your account balances, recent transactions, documents, or scheduling time with your advisor. What would you like to look into?',
    toolDelay: 500,
  },
};

export function detectTrigger(input: string): MockTrigger {
  const lower = input.toLowerCase();
  if (/balance|total|aum|worth|how much/.test(lower)) return 'balance';
  if (/portfolio|allocation|performance|growth|holding/.test(lower)) return 'portfolio';
  if (/transfer|wire|deposit|go through|sent/.test(lower)) return 'transfer';
  if (/transaction|activity|history|recent/.test(lower)) return 'transaction';
  if (/statement|document|report|download/.test(lower)) return 'statement';
  if (/schedule|call|meeting|advisor|claire|appointment/.test(lower)) return 'schedule';
  if (/invest|move|put|add|new fund|capital/.test(lower)) return 'invest';
  if (/tax|roth|ira|estate|trust|beneficiary/.test(lower)) return 'tax';
  return 'default';
}
