# Spec: Phase 3 — Container Components

**Phase:** 3  
**Status:** Pending  
**Duration:** 1 week  
**Components:** 6 (Card, Divider, Breadcrumb, Tabs, Accordion, Badge)  
**Date Created:** 2026-05-07  
**Week:** 5  

---

## 1. Overview

Migrate 6 container and layout components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| Card | `dcx-ng-card` | `<dcx-card>` | Pending |
| Divider | `dcx-ng-divider` | `<dcx-divider>` | Pending |
| Breadcrumb | `dcx-ng-breadcrumb` | `<dcx-breadcrumb>` | Pending |
| Tabs | `dcx-ng-tabs` | `<dcx-tabs>` | Pending |
| Accordion | `dcx-ng-accordion` | `<dcx-accordion>` | Pending |
| Badge | `dcx-ng-badge` | `<dcx-badge>` | Pending |

Container components organize and display content in structured layouts.

---

## 2. Acceptance Criteria

- [ ] All 6 components migrated to LitElement
- [ ] 90%+ code coverage for each component
- [ ] All tests passing
- [ ] Wiki demo pages created for each component
- [ ] API matches Angular version
- [ ] Accessibility verified (keyboard nav, ARIA attributes)
- [ ] ESLint clean, TypeScript strict
- [ ] CSS customization via `::part()` and CSS variables
- [ ] Build produces no warnings

---

## 3. Components Detail

### 3.1 Card

**Spec Summary:**
- Header, body, and footer sections
- Image support
- Elevation/shadow variants
- Clickable card behavior
- Hover effects
- Events: `click`, `dcx-card-click`

**API:**
```typescript
interface DcxCardOptions {
  title?: string;
  subtitle?: string;
  image?: string;
  elevation?: 'none' | 'sm' | 'md' | 'lg';
  clickable?: boolean;
  disabled?: boolean;
  padding?: 'sm' | 'md' | 'lg';
}
```

### 3.2 Divider

**Spec Summary:**
- Horizontal and vertical orientation
- Text/label support
- Color variants
- Dashed/solid style options
- Spacing control
- Events: none

**API:**
```typescript
interface DcxDividerOptions {
  label?: string;
  vertical?: boolean;
  style?: 'solid' | 'dashed' | 'dotted';
  color?: string;
  margin?: 'sm' | 'md' | 'lg';
}
```

### 3.3 Breadcrumb

**Spec Summary:**
- Navigation breadcrumb trail
- Custom separator support
- Link vs. text items
- Events on navigation
- Keyboard navigation
- Active state indication
- Responsive collapse behavior

**API:**
```typescript
interface DcxBreadcrumbOptions {
  items: Array<{
    label: string;
    href?: string;
    active?: boolean;
    disabled?: boolean;
  }>;
  separator?: string;
  collapsible?: boolean;
  ariaLabel?: string;
}
```

### 3.4 Tabs

**Spec Summary:**
- Tab navigation with content switching
- Vertical and horizontal orientation
- Icon + text labels
- Disabled tabs
- Lazy loading of content
- Events: `change`
- Keyboard navigation (arrow keys)

**API:**
```typescript
interface DcxTabsOptions {
  tabs: Array<{
    label: string;
    icon?: string;
    disabled?: boolean;
    lazy?: boolean;
  }>;
  activeTab?: number;
  vertical?: boolean;
  scrollable?: boolean;
}
```

### 3.5 Accordion

**Spec Summary:**
- Expandable/collapsible sections
- Single or multiple open sections
- Icon indicators
- Header customization
- Content lazy loading
- Events: `toggle`, `open`, `close`
- Keyboard navigation

**API:**
```typescript
interface DcxAccordionOptions {
  items: Array<{
    label: string;
    icon?: string;
    disabled?: boolean;
    expanded?: boolean;
    lazy?: boolean;
  }>;
  multiple?: boolean;
  closeOthers?: boolean;
}
```

### 3.6 Badge

**Spec Summary:**
- Notification badges
- Variants: primary, secondary, success, warning, error
- Sizes: sm, md, lg
- Dot variant (minimal badge)
- Counter display
- Position (for overlay use)
- Events: none

**API:**
```typescript
interface DcxBadgeOptions {
  label?: string;
  variant?: 'primary' | 'secondary' | 'success' | 'warning' | 'error';
  size?: 'sm' | 'md' | 'lg';
  dot?: boolean;
  count?: number;
  max?: number;
}
```

---

## 4. Quality Gates

- [ ] TypeScript strict mode: all components
- [ ] ESLint: 0 errors, 0 warnings
- [ ] Unit test coverage: 90%+ per component
- [ ] Integration tests: component interactions
- [ ] Accessibility: keyboard nav, ARIA labels
- [ ] No circular dependencies
- [ ] Build time: < 15 seconds
- [ ] Bundle size tracked

---

## 5. Testing Strategy

**Unit Tests (per component):**
- Rendering and slot projection
- Property changes and reactivity
- User interactions
- Event emissions
- State management
- Disabled/error states

**Accessibility Tests:**
- Keyboard navigation where applicable
- ARIA attributes correct
- Focus management
- Screen reader announcements

**Integration Tests:**
- Tab switching (Tabs component)
- Accordion expand/collapse
- Breadcrumb navigation

---

## 6. Wiki Demo Template

Each component gets a dedicated demo page showing all variants and states.

---

## 7. Out of Scope

- Animation optimization (Phase 8)
- Responsive breakpoint customization (Phase 9)
