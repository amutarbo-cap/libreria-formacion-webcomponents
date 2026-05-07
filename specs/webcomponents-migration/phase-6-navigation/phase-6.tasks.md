# Phase 6 — Tasks & Implementation

**Phase:** 6  
**Status:** Pending  
**Duration:** 1 week (5 days)  
**Total Tasks:** 12 (3 per component × 4 components)  
**Estimated Time:** 55 hours  

---

## Task Groups

### Component 1: Navbar (Days 1-2)

- [ ] **Task 6.1** — Implement `dcx-navbar` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-navbar/`
  - [ ] Brand/logo slot
  - [ ] Menu items rendering
  - [ ] Active link indication
  - [ ] Dropdown submenu support
  - [ ] Icons in menu items
  - [ ] Hamburger menu for mobile
  - [ ] Sticky option
  - [ ] Responsive behavior
  - [ ] Emit events: `dcx-navigate`, `dcx-menu-toggle`
  - **Time:** 9 hours

- [ ] **Task 6.2** — Write tests for Navbar (90%+ coverage)
  - [ ] Test: rendering, navigation, responsive behavior
  - [ ] Verify coverage: 90%+
  - **Time:** 5 hours

- [ ] **Task 6.3** — Create Wiki demo page for Navbar
  - [ ] Show navbar with menu items
  - [ ] Show with logo/brand
  - [ ] Show with submenus
  - [ ] Show responsive/mobile view
  - [ ] Show active state
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 2: Sidebar (Days 2-3)

- [ ] **Task 6.4** — Implement `dcx-sidebar` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-sidebar/`
  - [ ] Menu items with hierarchical structure
  - [ ] Icons with labels
  - [ ] Collapsible items (children)
  - [ ] Collapse/expand animation
  - [ ] Mini mode (icons only)
  - [ ] Active item highlighting
  - [ ] Scrollable content
  - [ ] Emit events: `dcx-item-click`, `dcx-toggle`
  - **Time:** 8 hours

- [ ] **Task 6.5** — Write tests for Sidebar
  - [ ] Test: hierarchy, collapse/expand, mini mode
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 6.6** — Create Wiki demo page for Sidebar
  - [ ] Show expanded sidebar
  - [ ] Show collapsed sidebar
  - [ ] Show mini mode
  - [ ] Show hierarchical items
  - [ ] Show active state
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 3: ScrollTopDown (Days 3-4)

- [ ] **Task 6.7** — Implement `dcx-scroll-top-down` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-scroll-top-down/`
  - [ ] Scroll-to-top button
  - [ ] Scroll-to-bottom button
  - [ ] Show/hide threshold on scroll
  - [ ] Smooth scroll animation
  - [ ] Keyboard shortcut support (Page Up/Page Down)
  - [ ] Position variants
  - [ ] Tooltip on hover
  - [ ] Emit events: `dcx-scroll-top`, `dcx-scroll-bottom`
  - **Time:** 6 hours

- [ ] **Task 6.8** — Write tests for ScrollTopDown
  - [ ] Test: scroll actions, show/hide logic, keyboard
  - [ ] Verify coverage: 90%+
  - **Time:** 3 hours

- [ ] **Task 6.9** — Create Wiki demo page for ScrollTopDown
  - [ ] Show both buttons
  - [ ] Show hide threshold
  - [ ] Show smooth scrolling
  - [ ] Show position variants
  - [ ] Show keyboard shortcuts
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 4: Divider (Days 4-5)

- [ ] **Task 6.10** — Implement `dcx-divider` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-divider/`
  - [ ] Horizontal orientation
  - [ ] Vertical orientation
  - [ ] Text/label support
  - [ ] Style variants: solid, dashed, dotted
  - [ ] Color customization
  - [ ] Margin variants
  - [ ] Thick/thin variants
  - **Time:** 5 hours

- [ ] **Task 6.11** — Write tests for Divider
  - [ ] Test: orientation, styles, text rendering
  - [ ] Verify coverage: 90%+
  - **Time:** 3 hours

- [ ] **Task 6.12** — Create Wiki demo page for Divider
  - [ ] Show horizontal and vertical
  - [ ] Show with text/labels
  - [ ] Show all style variants
  - [ ] Show color options
  - [ ] Add API reference
  - **Time:** 2 hours

---

## Final Validation

Before marking Phase 6 complete:

- [ ] All 4 components have tests with 90%+ coverage
- [ ] All Wiki demo pages created
- [ ] `npm test -- dcx-web-lib` passes all tests
- [ ] `npm run lint` passes with 0 errors
- [ ] `npx nx build dcx-web-lib` succeeds
- [ ] Responsive behavior verified
- [ ] Keyboard navigation verified
