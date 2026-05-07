# Phase 4 — Tasks & Implementation

**Phase:** 4  
**Status:** Pending  
**Duration:** 1 week (5 days)  
**Total Tasks:** 21 (3 per component × 7 components)  
**Estimated Time:** 80 hours  

---

## Task Groups

### Component 1: Dialog (Days 1)

- [ ] **Task 4.1** — Implement `dcx-dialog` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-dialog/`
  - [ ] Modal with backdrop
  - [ ] Focus trap and restore on close
  - [ ] Configurable buttons with actions
  - [ ] Close on Escape key
  - [ ] Close on backdrop click (configurable)
  - [ ] Emit events: `dcx-open`, `dcx-close`, `dcx-action`
  - **Time:** 8 hours

- [ ] **Task 4.2** — Write tests for Dialog (90%+ coverage)
  - [ ] Test: focus trap, close behavior, event emissions
  - [ ] Verify coverage: 90%+
  - **Time:** 5 hours

- [ ] **Task 4.3** — Create Wiki demo page for Dialog
  - [ ] Show alert dialog
  - [ ] Show confirmation dialog
  - [ ] Show custom buttons
  - [ ] Show different sizes
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 2: Drawer (Days 1-2)

- [ ] **Task 4.4** — Implement `dcx-drawer` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-drawer/`
  - [ ] Support: left, right, top, bottom positions
  - [ ] Slide-in animation
  - [ ] Focus trap
  - [ ] Close on backdrop click
  - [ ] Close on Escape key
  - [ ] Emit events: `dcx-open`, `dcx-close`
  - **Time:** 8 hours

- [ ] **Task 4.5** — Write tests for Drawer
  - [ ] Test: positioning, animations, focus management
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 4.6** — Create Wiki demo page for Drawer
  - [ ] Show left drawer
  - [ ] Show right drawer
  - [ ] Show top/bottom drawers
  - [ ] Show animations
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 3: Popover (Days 2-3)

- [ ] **Task 4.7** — Implement `dcx-popover` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-popover/`
  - [ ] Position relative to trigger element
  - [ ] Support: top, bottom, left, right positions
  - [ ] Auto-flip on viewport edge
  - [ ] Arrow indicator
  - [ ] Close on outside click
  - [ ] Emit events: `dcx-open`, `dcx-close`
  - **Time:** 8 hours

- [ ] **Task 4.8** — Write tests for Popover
  - [ ] Test: positioning, auto-flip, click outside
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 4.9** — Create Wiki demo page for Popover
  - [ ] Show all positions
  - [ ] Show auto-flip behavior
  - [ ] Show with arrow
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 4: Tooltip (Days 3-4)

- [ ] **Task 4.10** — Implement `dcx-tooltip` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-tooltip/`
  - [ ] Hover-triggered tooltip
  - [ ] Position variants
  - [ ] Configurable delay
  - [ ] Keyboard accessible (focus shows)
  - [ ] Arrow pointing to trigger
  - [ ] Auto-hide outside trigger
  - **Time:** 6 hours

- [ ] **Task 4.11** — Write tests for Tooltip
  - [ ] Test: hover trigger, focus trigger, positioning
  - [ ] Verify coverage: 90%+
  - **Time:** 3 hours

- [ ] **Task 4.12** — Create Wiki demo page for Tooltip
  - [ ] Show all positions
  - [ ] Show hover and focus triggers
  - [ ] Show delay configuration
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 5: ContextMenu (Days 4)

- [ ] **Task 4.13** — Implement `dcx-context-menu` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-context-menu/`
  - [ ] Right-click trigger
  - [ ] Menu items with icons
  - [ ] Submenu support
  - [ ] Keyboard navigation (arrow keys, Enter)
  - [ ] Disabled items
  - [ ] Close on click outside
  - [ ] Emit events: `dcx-item-click`
  - **Time:** 8 hours

- [ ] **Task 4.14** — Write tests for ContextMenu
  - [ ] Test: right-click trigger, keyboard nav, submenus
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 4.15** — Create Wiki demo page for ContextMenu
  - [ ] Show basic menu
  - [ ] Show with submenus
  - [ ] Show disabled items
  - [ ] Show icons in menu items
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 6: Toast (Days 5)

- [ ] **Task 4.16** — Implement `dcx-toast` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-toast/`
  - [ ] Auto-dismiss after duration
  - [ ] Position variants (4 corners + center)
  - [ ] Variants: success, error, warning, info
  - [ ] Progress bar for timeout
  - [ ] Close button
  - [ ] Stack multiple toasts
  - [ ] Emit events: `dcx-dismiss`
  - **Time:** 7 hours

- [ ] **Task 4.17** — Write tests for Toast
  - [ ] Test: auto-dismiss, stacking, variants
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 4.18** — Create Wiki demo page for Toast
  - [ ] Show all variants
  - [ ] Show all positions
  - [ ] Show stacked toasts
  - [ ] Show close behavior
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 7: Message (Days 5)

- [ ] **Task 4.19** — Implement `dcx-message` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-message/`
  - [ ] Variants: info, warning, error, success
  - [ ] Icon indicators (auto from variant)
  - [ ] Closeable support
  - [ ] Action button support
  - [ ] Inline rendering (no modal backdrop)
  - [ ] Emit events: `dcx-close`, `dcx-action`
  - **Time:** 5 hours

- [ ] **Task 4.20** — Write tests for Message
  - [ ] Test: variants, close behavior, action click
  - [ ] Verify coverage: 90%+
  - **Time:** 3 hours

- [ ] **Task 4.21** — Create Wiki demo page for Message
  - [ ] Show all variants
  - [ ] Show with icons
  - [ ] Show with actions
  - [ ] Show closeable state
  - [ ] Add API reference
  - **Time:** 2 hours

---

## Final Validation

Before marking Phase 4 complete:

- [ ] All 7 components have tests with 90%+ coverage
- [ ] All Wiki demo pages created and linked
- [ ] `npm test -- dcx-web-lib` passes all tests
- [ ] `npm run lint` passes with 0 errors
- [ ] `npx nx build dcx-web-lib` succeeds
- [ ] No console errors in demos
- [ ] Focus trap tested for Dialog and Drawer
- [ ] Keyboard navigation verified for all components
