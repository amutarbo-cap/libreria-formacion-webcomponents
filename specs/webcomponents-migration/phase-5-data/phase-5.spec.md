# Spec: Phase 5 — Data Components

**Phase:** 5  
**Status:** Pending  
**Duration:** 1 week  
**Components:** 6 (FullTable, Paginator, List, DatePicker, Spinner, Stepper)  
**Date Created:** 2026-05-07  
**Week:** 7  

---

## 1. Overview

Migrate 6 data-display and date components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| FullTable | `dcx-ng-full-table` | `<dcx-full-table>` | Pending |
| Paginator | `dcx-ng-paginator` | `<dcx-paginator>` | Pending |
| List | `dcx-ng-list` | `<dcx-list>` | Pending |
| DatePicker | `dcx-ng-date-picker` | `<dcx-date-picker>` | Pending |
| Spinner | `dcx-ng-spinner` | `<dcx-spinner>` | Pending |
| Stepper | `dcx-ng-stepper` | `<dcx-stepper>` | Pending |

Data components handle complex data rendering and user interactions with dates and multi-step workflows.

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

### 3.1 FullTable

**Spec Summary:**
- Sortable columns
- Filterable columns
- Pagination integration
- Row selection (single/multi)
- Expandable rows
- Sticky header/footer
- Virtual scrolling (Phase 8)
- Events: `sort`, `filter`, `row-select`, `row-click`

**API:**
```typescript
interface DcxFullTableOptions {
  columns: Array<{ key: string; label: string; sortable?: boolean; filterable?: boolean }>;
  data: any[];
  paginated?: boolean;
  pageSize?: number;
  selectable?: boolean;
  multiSelect?: boolean;
  expandable?: boolean;
  stickyHeader?: boolean;
}
```

### 3.2 Paginator

**Spec Summary:**
- Page navigation controls
- Page size selector
- Total items display
- First/prev/next/last buttons
- Keyboard navigation
- Events: `page-change`, `page-size-change`

**API:**
```typescript
interface DcxPaginatorOptions {
  totalItems: number;
  pageSize?: number;
  currentPage?: number;
  pageSizeOptions?: number[];
  showPageSizeSelector?: boolean;
  showPageInfo?: boolean;
}
```

### 3.3 List

**Spec Summary:**
- Vertical list of items
- Custom item rendering
- Selection mode (single/multi/none)
- Hover effects
- Keyboard navigation (arrow keys)
- Events: `item-select`, `item-click`

**API:**
```typescript
interface DcxListOptions {
  items: any[];
  selectable?: boolean;
  multiSelect?: boolean;
  selectedItem?: any;
  selectedItems?: any[];
}
```

### 3.4 DatePicker

**Spec Summary:**
- Calendar view
- Month/year navigation
- Date selection
- Range selection (optional)
- Disabled dates
- Min/max date constraints
- Keyboard navigation
- Events: `date-select`, `date-change`

**API:**
```typescript
interface DcxDatePickerOptions {
  value?: Date;
  range?: boolean;
  minDate?: Date;
  maxDate?: Date;
  disabledDates?: Date[];
  locale?: string;
  showTime?: boolean;
}
```

### 3.5 Spinner

**Spec Summary:**
- Loading indicator animation
- Size variants
- Color variants
- Message support
- Overlay mode (fullscreen spinner)
- Events: none

**API:**
```typescript
interface DcxSpinnerOptions {
  size?: 'sm' | 'md' | 'lg';
  message?: string;
  color?: string;
  overlay?: boolean;
  speed?: number;
}
```

### 3.6 Stepper

**Spec Summary:**
- Multi-step form/wizard
- Step indicator with labels
- Navigation buttons
- Validation per step
- Optional steps
- Linear (ordered) or non-linear navigation
- Events: `step-change`, `complete`

**API:**
```typescript
interface DcxStepperOptions {
  steps: Array<{
    label: string;
    description?: string;
    optional?: boolean;
    completed?: boolean;
  }>;
  activeStep?: number;
  linear?: boolean;
  allowSkip?: boolean;
}
```

---

## 4. Quality Gates

- [ ] TypeScript strict mode: all components
- [ ] ESLint: 0 errors, 0 warnings
- [ ] Unit test coverage: 90%+ per component
- [ ] Integration tests: data manipulation, navigation
- [ ] Accessibility: keyboard nav, ARIA attributes
- [ ] No circular dependencies
- [ ] Build time: < 15 seconds
- [ ] Bundle size tracked

---

## 5. Testing Strategy

**Unit Tests:**
- Data rendering and updates
- Sorting and filtering
- Selection behavior
- Navigation controls
- Date calculations
- Animations

**Accessibility Tests:**
- Keyboard navigation (arrow keys, Tab, Enter)
- ARIA attributes (role, aria-selected, aria-expanded)
- Screen reader announcements

**Integration Tests:**
- FullTable + Paginator integration
- Multi-step workflows in Stepper
- Date range selection in DatePicker

---

## 6. Wiki Demo Template

Each component gets an interactive demo with sample data and all features demonstrated.

---

## 7. Out of Scope

- Virtual scrolling optimization (Phase 8)
- Advanced filtering/sorting strategies (Phase 9)
