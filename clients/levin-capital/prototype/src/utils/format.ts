// Formatting utilities — financial data
// All currency and percent formatting goes through here.
// Ensures tabular-nums logic and consistent display rules.

export function formatCurrency(value: number): string {
  const abs = Math.abs(value);
  const sign = value < 0 ? '-' : '';

  if (abs >= 1_000_000) {
    return `${sign}$${(abs / 1_000_000).toFixed(2)}M`;
  }
  if (abs >= 1_000) {
    return `${sign}$${abs.toLocaleString('en-US', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2,
    })}`;
  }
  return `${sign}$${abs.toFixed(2)}`;
}

export function formatPercent(value: number): string {
  return `${Math.abs(value).toFixed(2)}%`;
}

export function formatAsOf(iso: string): string {
  const date = new Date(iso);
  return date.toLocaleTimeString('en-US', {
    hour: 'numeric',
    minute: '2-digit',
    timeZoneName: 'short',
  });
}

export function formatDate(dateStr: string): string {
  const date = new Date(dateStr + 'T00:00:00');
  return date.toLocaleDateString('en-US', {
    month: 'short',
    day: 'numeric',
    year: 'numeric',
  });
}

export function formatTimestamp(iso: string): string {
  const date = new Date(iso);
  const now = new Date();
  const todayStart = new Date(now.getFullYear(), now.getMonth(), now.getDate());
  const msgStart = new Date(date.getFullYear(), date.getMonth(), date.getDate());

  if (msgStart.getTime() === todayStart.getTime()) {
    return date.toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' });
  }

  const yesterday = new Date(todayStart);
  yesterday.setDate(yesterday.getDate() - 1);
  if (msgStart.getTime() === yesterday.getTime()) {
    return `Yesterday ${date.toLocaleTimeString('en-US', { hour: 'numeric', minute: '2-digit' })}`;
  }

  return date.toLocaleDateString('en-US', { month: 'short', day: 'numeric' });
}

export function shouldShowTimestamp(prev: string | undefined, current: string): boolean {
  if (!prev) return false;
  const diff = new Date(current).getTime() - new Date(prev).getTime();
  return diff > 5 * 60 * 1000; // 5 minutes
}
