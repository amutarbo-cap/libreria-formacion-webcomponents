# Spec: Phase 2 — Selection Components

**Phase:** 2  
**Status:** Pending  
**Duration:** 1 week  
**Components:** 5 (Select, Radio, Icon, IconField, Slider)  
**Date Created:** 2026-05-07  
**Week:** 4  

---

## 1. Overview

Migrate 5 selection and icon components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| Select | `dcx-ng-select` | `<dcx-select>` | Pending |
| Radio | `dcx-ng-radio` | `<dcx-radio>` | Pending |
| Icon | `dcx-ng-icon` | `<dcx-icon>` | Pending |
| IconField | `dcx-ng-icon-field` | `<dcx-icon-field>` | Pending |
| Slider | `dcx-ng-slider` | `<dcx-slider>` | Pending |

Selection components enable user interaction for choosing single or multiple values from predefined options.

---

## 2. Acceptance Criteria

- [ ] All 5 components migrated to LitElement
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

### 3.1 Select

**Spec Summary:**
- Single and multiple selection modes
- Option groups support
- Filterable dropdown
- Custom option rendering
- Disabled state
- Error/validation state
- Events: `change`, `open`, `close`

**API:**
```typescript
interface DcxSelectOptions {
  label?: string;
  options: Array<{ label: string; value: string; disabled?: boolean }>;
  multiple?: boolean;
  disabled?: boolean;
  readonly?: boolean;
  searchable?: boolean;
  value?: string | string[];
  placeholder?: string;
  error?: boolean;
  errorMessage?: string;
}
```

### 3.2 Radio

**Spec Summary:**
- Vertical and horizontal layouts
- Group behavior with single selection
- Label support
- Disabled state per radio
- Events: `change`
- Keyboard navigation (arrow keys)

**API:**
```typescript
interface DcxRadioOptions {
  name: string;
  options: Array<{ label: string; value: string; disabled?: boolean }>;
  value?: string;
  disabled?: boolean;
  direction?: 'vertical' | 'horizontal';
}
```

### 3.3 Icon

**Spec Summary:**
- SVG icon support
- Icon size variants (xs, sm, md, lg, xl)
- Color customization
- Spin/rotate animations
- Icon library integration
- Accessible icons with title attribute

**API:**
```typescript
interface DcxIconOptions {
  name: string;
  size?: 'xs' | 'sm' | 'md' | 'lg' | 'xl';
  color?: string;
  spin?: boolean;
  rotate?: 0 | 90 | 180 | 270;
  title?: string;
  ariaLabel?: string;
}
```

### 3.4 IconField

**Spec Summary:**
- Input with leading/trailing icon slots
- Icon button support
- Clickable icons
- Icon visibility toggle (password reveal)
- Events: `icon-click`
- Works with Input component

**API:**
```typescript
interface DcxIconFieldOptions {
  leadingIcon?: string;
  trailingIcon?: string;
  leadingIconClickable?: boolean;
  trailingIconClickable?: boolean;
  onLeadingIconClick?: () => void;
  onTrailingIconClick?: () => void;
}
```

### 3.5 Slider

**Spec Summary:**
- Single and range sliders
- Min/max bounds
- Step intervals
- Disabled state
- Vertical and horizontal orientation
- Value display
- Keyboard support (arrow keys)
- Events: `input`, `change`

**API:**
```typescript
interface DcxSliderOptions {
  min?: number;
  max?: number;
  step?: number;
  value?: number | [number, number];
  disabled?: boolean;
  vertical?: boolean;
  showValue?: boolean;
  showLabels?: boolean;
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
- [ ] Bundle size: baseline (will be tracked in Phase 8)

---

## 5. Testing Strategy

**Unit Tests (per component):**
- Properties and default values
- User interactions (click, keyboard)
- Event emissions
- State changes
- Error handling
- Disabled states

**Accessibility Tests:**
- Keyboard navigation (Tab, Enter, Arrow keys)
- ARIA attributes (role, aria-label, aria-describedby)
- Focus management
- Screen reader announcements

**Integration Tests:**
- Multiple selections (for Select, Radio)
- Value updates cascading
- Error state + validation message

---

## 6. Wiki Demo Template

Each component gets a dedicated page at `http://localhost:3000/components/{component}/`:

```html
<dcx-demo-page>
  <h1>Component Name</h1>
  <p>Brief description</p>
  
  <!-- Variants -->
  <section id="variants">
    <h2>Variants</h2>
    <!-- Interactive demo for each variant -->
  </section>
  
  <!-- States -->
  <section id="states">
    <h2>States</h2>
    <!-- Disabled, Error, etc. -->
  </section>
  
  <!-- API -->
  <section id="api">
    <h2>API Reference</h2>
    <table>...</table>
  </section>
  
  <!-- CSS Variables -->
  <section id="customization">
    <h2>Customization</h2>
    <!-- CSS variable examples -->
  </section>
</dcx-demo-page>
```

---

## 7. Out of Scope

- Virtual scrolling for very large option lists (Phase 8 optimization)
- Internationalization/locale-specific formatting (Phase 9)
- Integrations with external state management libraries
