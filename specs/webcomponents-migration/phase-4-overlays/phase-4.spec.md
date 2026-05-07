# Spec: Phase 4 — Overlay Components

**Phase:** 4  
**Status:** Pending  
**Duration:** 1 week  
**Components:** 7 (Dialog, Drawer, Popover, Tooltip, ContextMenu, Toast, Message)  
**Date Created:** 2026-05-07  
**Week:** 6  

---

## 1. Overview

Migrate 7 overlay components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| Dialog | `dcx-ng-dialog` | `<dcx-dialog>` | Pending |
| Drawer | `dcx-ng-drawer` | `<dcx-drawer>` | Pending |
| Popover | `dcx-ng-popover` | `<dcx-popover>` | Pending |
| Tooltip | `dcx-ng-tooltip` | `<dcx-tooltip>` | Pending |
| ContextMenu | `dcx-ng-context-menu` | `<dcx-context-menu>` | Pending |
| Toast | `dcx-ng-toast` | `<dcx-toast>` | Pending |
| Message | `dcx-ng-message` | `<dcx-message>` | Pending |

Overlay components display content on top of other elements or as notifications.

---

## 2. Acceptance Criteria

- [ ] All 7 components migrated to LitElement
- [ ] 90%+ code coverage for each component
- [ ] All tests passing
- [ ] Wiki demo pages created for each component
- [ ] API matches Angular version
- [ ] Accessibility verified (focus trap, ARIA attributes)
- [ ] ESLint clean, TypeScript strict
- [ ] CSS customization via `::part()` and CSS variables
- [ ] Build produces no warnings

---

## 3. Components Detail

### 3.1 Dialog

**Spec Summary:**
- Modal dialog with backdrop
- Header, body, footer sections
- Configurable buttons
- Focus trap and restore
- Close on backdrop click (configurable)
- Keyboard close on Escape
- Events: `open`, `close`, `action`

**API:**
```typescript
interface DcxDialogOptions {
  title?: string;
  message?: string;
  closeOnBackdropClick?: boolean;
  showBackdrop?: boolean;
  buttons?: Array<{ label: string; action: string; variant?: string }>;
  size?: 'sm' | 'md' | 'lg';
}
```

### 3.2 Drawer

**Spec Summary:**
- Side panel (left/right/top/bottom)
- Slide-in animation
- Header and body sections
- Close button
- Backdrop (optional)
- Focus trap
- Events: `open`, `close`

**API:**
```typescript
interface DcxDrawerOptions {
  title?: string;
  position?: 'left' | 'right' | 'top' | 'bottom';
  width?: string;
  showBackdrop?: boolean;
  closeOnBackdropClick?: boolean;
  animated?: boolean;
}
```

### 3.3 Popover

**Spec Summary:**
- Positioned relative to trigger element
- Arrow pointing to trigger
- Auto-flip on viewport edge
- Close on outside click
- Focus management
- Events: `open`, `close`

**API:**
```typescript
interface DcxPopoverOptions {
  trigger?: string;
  content?: string;
  position?: 'top' | 'bottom' | 'left' | 'right';
  offset?: number;
  autoFlip?: boolean;
  showArrow?: boolean;
}
```

### 3.4 Tooltip

**Spec Summary:**
- Lightweight hover-triggered tooltip
- Position variants
- Delay options
- Keyboard accessible (focus shows tooltip)
- Auto-hide outside trigger
- Events: none (internal state)

**API:**
```typescript
interface DcxTooltipOptions {
  content: string;
  position?: 'top' | 'bottom' | 'left' | 'right';
  delay?: number;
  maxWidth?: string;
  ariaLabel?: string;
}
```

### 3.5 ContextMenu

**Spec Summary:**
- Right-click context menu
- Menu items with icons and submenus
- Keyboard navigation (arrow keys)
- Disabled items support
- Events: `item-click`

**API:**
```typescript
interface DcxContextMenuOptions {
  items: Array<{
    label: string;
    icon?: string;
    disabled?: boolean;
    submenu?: DcxContextMenuOptions['items'];
    action?: string;
  }>;
}
```

### 3.6 Toast

**Spec Summary:**
- Auto-dismiss notification
- Position variants
- Variants: success, error, warning, info
- Close button (optional)
- Progress bar for timeout
- Stack management
- Events: `dismiss`

**API:**
```typescript
interface DcxToastOptions {
  message: string;
  variant?: 'success' | 'error' | 'warning' | 'info';
  duration?: number;
  position?: 'top-right' | 'bottom-right' | 'bottom-left' | 'top-left';
  showClose?: boolean;
  icon?: string;
}
```

### 3.7 Message

**Spec Summary:**
- Inline message/alert
- Variants: info, warning, error, success
- Icon indicators
- Closeable (optional)
- Action button support
- Events: `close`, `action`

**API:**
```typescript
interface DcxMessageOptions {
  message: string;
  variant?: 'info' | 'warning' | 'error' | 'success';
  icon?: string;
  closeable?: boolean;
  action?: { label: string; callback: () => void };
}
```

---

## 4. Quality Gates

- [ ] TypeScript strict mode: all components
- [ ] ESLint: 0 errors, 0 warnings
- [ ] Unit test coverage: 90%+ per component
- [ ] Integration tests: overlays, focus trap, keyboard
- [ ] Accessibility: focus management, ARIA, keyboard nav
- [ ] No circular dependencies
- [ ] Build time: < 15 seconds
- [ ] Bundle size tracked

---

## 5. Testing Strategy

**Unit Tests:**
- Component visibility and rendering
- Event emissions
- Close behavior
- Position calculations (for positioned overlays)
- Focus management

**Accessibility Tests:**
- Focus trap (Dialog, Drawer)
- Escape key closes modal
- ARIA attributes (role, aria-modal, aria-label)
- Keyboard navigation (Context menu items)
- Screen reader announcements

**Integration Tests:**
- Multiple overlays stacking
- Focus restoration after close
- Backdrop click behavior

---

## 6. Wiki Demo Template

Each component gets an interactive demo with all variants and states.

---

## 7. Out of Scope

- Animation performance optimization (Phase 8)
- Advanced positioning strategies (Phase 9)
