# Spec: Phase 6 — Navigation Components

**Phase:** 6  
**Status:** Pending  
**Duration:** 1 week  
**Components:** 4 (Navbar, Sidebar, ScrollTopDown, Divider)  
**Date Created:** 2026-05-07  
**Week:** 8  

---

## 1. Overview

Migrate 4 navigation components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| Navbar | `dcx-ng-navbar` | `<dcx-navbar>` | Pending |
| Sidebar | `dcx-ng-sidebar` | `<dcx-sidebar>` | Pending |
| ScrollTopDown | `dcx-ng-scroll-top-down` | `<dcx-scroll-top-down>` | Pending |
| Divider | `dcx-ng-divider` | `<dcx-divider>` | Pending |

Navigation components provide primary and secondary navigation structures for applications.

---

## 2. Acceptance Criteria

- [ ] All 4 components migrated to LitElement
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

### 3.1 Navbar

**Spec Summary:**
- Top navigation bar
- Logo/brand slot
- Menu items with links
- Hamburger menu for mobile
- Active link highlighting
- Dropdown submenus (optional)
- Icons in nav items
- Search integration (optional)
- Events: `navigate`, `menu-toggle`

**API:**
```typescript
interface DcxNavbarOptions {
  brand?: string;
  logo?: string;
  items: Array<{
    label: string;
    href: string;
    icon?: string;
    active?: boolean;
    submenu?: DcxNavbarOptions['items'];
  }>;
  sticky?: boolean;
  responsive?: boolean;
  showSearch?: boolean;
}
```

### 3.2 Sidebar

**Spec Summary:**
- Collapsible side navigation
- Hierarchical menu items
- Icons with labels
- Collapse/expand animation
- Mini mode (icons only)
- Active item highlighting
- Scrollable content
- Events: `item-click`, `toggle`

**API:**
```typescript
interface DcxSidebarOptions {
  items: Array<{
    label: string;
    icon: string;
    href?: string;
    children?: DcxSidebarOptions['items'];
    active?: boolean;
  }>;
  collapsed?: boolean;
  miniMode?: boolean;
  showIcons?: boolean;
  maxWidth?: string;
}
```

### 3.3 ScrollTopDown

**Spec Summary:**
- Scroll-to-top button
- Scroll-to-bottom button
- Show/hide on scroll
- Smooth scroll animation
- Keyboard shortcut support
- Tooltip on hover
- Position variants
- Events: `scroll-top`, `scroll-bottom`

**API:**
```typescript
interface DcxScrollTopDownOptions {
  showTopButton?: boolean;
  showBottomButton?: boolean;
  showThreshold?: number;
  position?: 'bottom-right' | 'bottom-left' | 'top-right' | 'top-left';
  smooth?: boolean;
}
```

### 3.4 Divider

**Spec Summary:**
- Horizontal and vertical line
- Optional label/title
- Color variants
- Style variants (solid, dashed, dotted)
- Spacing control
- Responsive

**API:**
```typescript
interface DcxDividerOptions {
  label?: string;
  vertical?: boolean;
  style?: 'solid' | 'dashed' | 'dotted';
  color?: string;
  margin?: 'sm' | 'md' | 'lg';
  thick?: boolean;
}
```

---

## 4. Quality Gates

- [ ] TypeScript strict mode: all components
- [ ] ESLint: 0 errors, 0 warnings
- [ ] Unit test coverage: 90%+ per component
- [ ] Integration tests: navigation flows
- [ ] Accessibility: keyboard nav, ARIA attributes
- [ ] No circular dependencies
- [ ] Build time: < 15 seconds
- [ ] Bundle size tracked

---

## 5. Testing Strategy

**Unit Tests:**
- Component rendering
- Menu item navigation
- Collapse/expand behavior
- Scroll-to actions
- Active state tracking

**Accessibility Tests:**
- Keyboard navigation (Tab, arrow keys, Enter)
- ARIA attributes (role, aria-expanded, aria-current)
- Focus management
- Screen reader announcements

**Integration Tests:**
- Multi-level menu navigation
- Sidebar collapse with page layout
- Scroll buttons in page context

---

## 6. Wiki Demo Template

Each component gets an interactive demo with all features demonstrated.

---

## 7. Out of Scope

- Mobile responsive optimization (Phase 9)
- Dynamic menu loading (Phase 9)
