import { useState, useCallback, useRef } from 'react';
import type { ConversationState, Message, InlineCardData } from '../types';
import { detectTrigger, MOCK_RESPONSES, MOCK_CLIENT } from '../mock/data';

const SESSION_ID = `session_${Date.now()}`;

function makeId(): string {
  return `msg_${Date.now()}_${Math.random().toString(36).slice(2, 7)}`;
}

function now(): string {
  return new Date().toISOString();
}

const INITIAL_STATE: ConversationState = {
  sessionId: SESSION_ID,
  clientId: MOCK_CLIENT.id,
  messages: [],
  activeTool: null,
  escalationTier: 0,
  pendingAdvisorSchedule: false,
  openCaseId: null,
};

export function useConversation() {
  const [state, setState] = useState<ConversationState>(INITIAL_STATE);
  const cancelRef = useRef<ReturnType<typeof setTimeout> | null>(null);

  const sendMessage = useCallback((text: string) => {
    if (!text.trim() || state.activeTool !== null) return;

    const userMessage: Message = {
      id: makeId(),
      role: 'user',
      content: text.trim(),
      timestamp: now(),
    };

    // Add loading agent message immediately
    const loadingId = makeId();
    const loadingMessage: Message = {
      id: loadingId,
      role: 'agent',
      content: '',
      timestamp: now(),
      isLoading: true,
    };

    setState(prev => ({
      ...prev,
      messages: [...prev.messages, userMessage, loadingMessage],
      activeTool: 'get_account_data',
    }));

    // Determine mock response
    const trigger = detectTrigger(text);
    const response = MOCK_RESPONSES[trigger];

    // Simulate tool call delay
    cancelRef.current = setTimeout(() => {
      const agentMessage: Message = {
        id: loadingId, // reuse id to replace loading message
        role: 'agent',
        content: response.text,
        timestamp: now(),
        inlineCard: response.inlineCard,
        isLoading: false,
      };

      setState(prev => ({
        ...prev,
        messages: prev.messages.map(m =>
          m.id === loadingId ? agentMessage : m
        ),
        activeTool: null,
        escalationTier: trigger === 'invest' || trigger === 'tax' ? 2 : prev.escalationTier,
        pendingAdvisorSchedule:
          trigger === 'schedule' || trigger === 'invest' || trigger === 'tax'
            ? true
            : prev.pendingAdvisorSchedule,
      }));
    }, response.toolDelay);
  }, [state.activeTool]);

  const cancelToolCall = useCallback(() => {
    if (cancelRef.current) {
      clearTimeout(cancelRef.current);
      cancelRef.current = null;
    }
    setState(prev => ({
      ...prev,
      // Remove loading message
      messages: prev.messages.filter(m => !m.isLoading),
      activeTool: null,
    }));
  }, []);

  const confirmSchedule = useCallback((slotId: string) => {
    const confirmMsg: Message = {
      id: makeId(),
      role: 'agent',
      content: `Confirmed. You're scheduled with Claire Hartwell. She will receive a brief from this conversation before your call.`,
      timestamp: now(),
    };
    setState(prev => ({
      ...prev,
      messages: [...prev.messages, confirmMsg],
      pendingAdvisorSchedule: false,
    }));
  }, []);

  const declineSchedule = useCallback(() => {
    const declineMsg: Message = {
      id: makeId(),
      role: 'agent',
      content: 'Understood. The offer stands whenever you are ready.',
      timestamp: now(),
    };
    setState(prev => ({
      ...prev,
      messages: [...prev.messages, declineMsg],
      pendingAdvisorSchedule: false,
    }));
  }, []);

  return {
    state,
    sendMessage,
    cancelToolCall,
    confirmSchedule,
    declineSchedule,
  };
}
