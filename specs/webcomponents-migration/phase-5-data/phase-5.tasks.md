# Phase 5 — Tasks & Implementation

**Phase:** 5  
**Status:** Pending  
**Duration:** 1 week (5 days)  
**Total Tasks:** 18 (3 per component × 6 components)  
**Estimated Time:** 75 hours  

---

## Task Groups

### Component 1: FullTable (Days 1-2)

- [ ] **Task 5.1** — Implement `dcx-full-table` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-full-table/`
  - [ ] Column configuration and rendering
  - [ ] Sortable columns implementation
  - [ ] Filterable columns implementation
  - [ ] Row selection (single and multi)
  - [ ] Expandable rows support
  - [ ] Sticky header/footer
  - [ ] Emit events: `dcx-sort`, `dcx-filter`, `dcx-row-select`, `dcx-row-click`
  - **Time:** 10 hours

- [ ] **Task 5.2** — Write tests for FullTable (90%+ coverage)
  - [ ] Test: sorting, filtering, selection, expansion
  - [ ] Verify coverage: 90%+
  - **Time:** 6 hours

- [ ] **Task 5.3** — Create Wiki demo page for FullTable
  - [ ] Show sample data table
  - [ ] Demonstrate sorting
  - [ ] Demonstrate filtering
  - [ ] Demonstrate row selection
  - [ ] Demonstrate expandable rows
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 2: Paginator (Days 2)

- [ ] **Task 5.4** — Implement `dcx-paginator` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-paginator/`
  - [ ] Navigation controls (first, prev, next, last)
  - [ ] Page number buttons
  - [ ] Page size selector
  - [ ] Total items and current page display
  - [ ] Keyboard navigation
  - [ ] Emit events: `dcx-page-change`, `dcx-page-size-change`
  - **Time:** 7 hours

- [ ] **Task 5.5** — Write tests for Paginator
  - [ ] Test: page navigation, size changes, keyboard nav
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 5.6** — Create Wiki demo page for Paginator
  - [ ] Show pagination controls
  - [ ] Show page size options
  - [ ] Show page info display
  - [ ] Show keyboard navigation
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 3: List (Days 2-3)

- [ ] **Task 5.7** — Implement `dcx-list` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-list/`
  - [ ] Item rendering via slot
  - [ ] Single selection mode
  - [ ] Multi selection mode
  - [ ] Hover and focus states
  - [ ] Keyboard navigation (arrow keys, Space)
  - [ ] Disabled items support
  - [ ] Emit events: `dcx-item-select`, `dcx-item-click`
  - **Time:** 7 hours

- [ ] **Task 5.8** — Write tests for List
  - [ ] Test: selection, keyboard nav, disabled items
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 5.9** — Create Wiki demo page for List
  - [ ] Show basic list
  - [ ] Show single selection
  - [ ] Show multi selection
  - [ ] Show keyboard navigation
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 4: DatePicker (Days 3-4)

- [ ] **Task 5.10** — Implement `dcx-date-picker` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-date-picker/`
  - [ ] Calendar view rendering
  - [ ] Month/year navigation
  - [ ] Date selection
  - [ ] Range selection (optional)
  - [ ] Min/max date constraints
  - [ ] Disabled dates support
  - [ ] Keyboard navigation
  - [ ] Emit events: `dcx-date-select`, `dcx-date-change`
  - **Time:** 9 hours

- [ ] **Task 5.11** — Write tests for DatePicker
  - [ ] Test: date selection, range, constraints, keyboard nav
  - [ ] Verify coverage: 90%+
  - **Time:** 5 hours

- [ ] **Task 5.12** — Create Wiki demo page for DatePicker
  - [ ] Show calendar view
  - [ ] Show date selection
  - [ ] Show range selection
  - [ ] Show min/max constraints
  - [ ] Show disabled dates
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 5: Spinner (Days 4)

- [ ] **Task 5.13** — Implement `dcx-spinner` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-spinner/`
  - [ ] SVG spinner animation
  - [ ] Size variants: sm, md, lg
  - [ ] Color customization
  - [ ] Message display support
  - [ ] Overlay (fullscreen) mode
  - [ ] Animation speed configuration
  - **Time:** 5 hours

- [ ] **Task 5.14** — Write tests for Spinner
  - [ ] Test: rendering, animation, variants
  - [ ] Verify coverage: 90%+
  - **Time:** 3 hours

- [ ] **Task 5.15** — Create Wiki demo page for Spinner
  - [ ] Show all size variants
  - [ ] Show color variants
  - [ ] Show with message
  - [ ] Show overlay mode
  - [ ] Add API reference
  - **Time:** 2 hours

---

### Component 6: Stepper (Days 4-5)

- [ ] **Task 5.16** — Implement `dcx-stepper` component
  - [ ] Create `libs/dcx-web-lib/src/lib/components/dcx-stepper/`
  - [ ] Step indicator rendering
  - [ ] Step labels and descriptions
  - [ ] Linear and non-linear navigation
  - [ ] Previous/next/skip controls
  - [ ] Step completion tracking
  - [ ] Optional steps support
  - [ ] Keyboard navigation
  - [ ] Emit events: `dcx-step-change`, `dcx-complete`
  - **Time:** 8 hours

- [ ] **Task 5.17** — Write tests for Stepper
  - [ ] Test: step navigation, completion, linear mode
  - [ ] Verify coverage: 90%+
  - **Time:** 4 hours

- [ ] **Task 5.18** — Create Wiki demo page for Stepper
  - [ ] Show step indicators
  - [ ] Show linear navigation
  - [ ] Show non-linear navigation
  - [ ] Show optional steps
  - [ ] Show completion flow
  - [ ] Add API reference
  - **Time:** 2 hours

---

## Final Validation

Before marking Phase 5 complete:

- [ ] All 6 components have tests with 90%+ coverage
- [ ] All Wiki demo pages created
- [ ] `npm test -- dcx-web-lib` passes all tests
- [ ] `npm run lint` passes with 0 errors
- [ ] `npx nx build dcx-web-lib` succeeds
- [ ] FullTable and Paginator integration tested
- [ ] Keyboard navigation verified for all components
