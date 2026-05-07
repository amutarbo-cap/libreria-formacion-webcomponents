# Spec: Phase 1 — Core Components

**Phase:** 1  
**Status:** Pending  
**Duration:** 2 weeks  
**Components:** 6 (Button, Input, Checkbox, Radio, Toggle, Textarea)  
**Date Created:** 2026-05-07  

---

## 1. Overview

Migrate 6 foundational form components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| Button | `dcx-ng-button` | `<dcx-button>` | Pending |
| Input | `dcx-ng-input` | `<dcx-input>` | Pending |
| Checkbox | `dcx-ng-checkbox` | `<dcx-checkbox>` | Pending |
| Radio | `dcx-ng-radio` | `<dcx-radio>` | Pending |
| Toggle | `dcx-ng-toggle` | `<dcx-toggle>` | Pending |
| Textarea | `dcx-ng-textarea` | `<dcx-textarea>` | Pending |

---

## 2. Acceptance Criteria

- [ ] All 6 components migrated to LitElement
- [ ] 90%+ code coverage for each component
- [ ] All tests passing
- [ ] Wiki demo pages created for each component
- [ ] API matches Angular version (inputs → properties, outputs → events)
- [ ] Accessibility verified (keyboard nav, ARIA attributes)
- [ ] ESLint clean, TypeScript strict
- [ ] CSS customization via `::part()` and CSS variables
- [ ] Build produces no warnings

---

## 3. Components Detail

### 3.1 Button

**Spec Summary:**
- Variants: primary, secondary, tertiary
- Sizes: sm, md, lg
- State: disabled, loading, active
- Events: `@click` emits `dcx-clicked`
- Accessibility: native `<button>` element, keyboard accessible

**API:**
```typescript
interface DcxButtonOptions {
  label: string;
  disabled?: boolean;
  variant?: 'primary' | 'secondary' | 'tertiary';
  size?: 'sm' | 'md' | 'lg';
  loading?: boolean;
}
```

---

### 3.2 Input

**Spec Summary:**
- Type: text, email, password, number, date
- Validation: required, min, max, pattern
- State: disabled, readonly, error
- Events: input, change, blur, focus
- Placeholder support

**API:**
```typescript
interface DcxInputOptions {
  label?: string;
  type?: string;
  value?: string;
  placeholder?: string;
  disabled?: boolean;
  readonly?: boolean;
  required?: boolean;
  error?: boolean;
  errorMessage?: string;
}
```

---

### 3.3 Checkbox

**Spec Summary:**
- Checked/unchecked/indeterminate states
- Label support
- Events: change, click
- Accessibility: proper labeling, keyboard nav

**API:**
```typescript
interface DcxCheckboxOptions {
  label?: string;
  checked?: boolean;
  disabled?: boolean;
  indeterminate?: boolean;
  name?: string;
  value?: string;
}
```

---

### 3.4 Radio

**Spec Summary:**
- Radio group behavior
- Single selection within group
- Label support
- Events: change

**API:**
```typescript
interface DcxRadioOptions {
  label?: string;
  checked?: boolean;
  disabled?: boolean;
  name?: string;
  value?: string;
}
```

---

### 3.5 Toggle

**Spec Summary:**
- On/off switch
- Label support
- Disabled state
- Events: change

**API:**
```typescript
interface DcxToggleOptions {
  label?: string;
  checked?: boolean;
  disabled?: boolean;
}
```

---

### 3.6 Textarea

**Spec Summary:**
- Multi-line text input
- Rows, cols sizing
- Disabled, readonly states
- Events: input, change

**API:**
```typescript
interface DcxTextareaOptions {
  label?: string;
  value?: string;
  placeholder?: string;
  rows?: number;
  cols?: number;
  disabled?: boolean;
  readonly?: boolean;
  required?: boolean;
}
```

---

## 4. Quality Gates

**Before proceeding to Phase 2:**
- [ ] 90%+ code coverage for all 6 components
- [ ] All unit tests passing
- [ ] ESLint clean
- [ ] TypeScript strict mode no errors
- [ ] Accessibility checks passed
- [ ] Wiki demos interactive
- [ ] No console errors

---

## 5. Testing Strategy

Each component needs:
- [ ] Unit tests (Jest + @testing-library/web-components)
- [ ] Accessibility tests (axe-core, keyboard nav)
- [ ] Integration tests (component interactions)

Target coverage:
- Statements: 90%+
- Branches: 90%+
- Functions: 90%+
- Lines: 90%+

---

## 6. Wiki Demo Template

Each component gets a demo page:

```html
<section class="component-demo dcx-button-demo">
  <h2>Button Component</h2>
  
  <section class="variants">
    <h3>Variants</h3>
    <dcx-button variant="primary" label="Primary"></dcx-button>
    <dcx-button variant="secondary" label="Secondary"></dcx-button>
    <dcx-button variant="tertiary" label="Tertiary"></dcx-button>
  </section>

  <section class="sizes">
    <h3>Sizes</h3>
    <dcx-button size="sm" label="Small"></dcx-button>
    <dcx-button size="md" label="Medium"></dcx-button>
    <dcx-button size="lg" label="Large"></dcx-button>
  </section>

  <section class="states">
    <h3>States</h3>
    <dcx-button label="Default"></dcx-button>
    <dcx-button disabled label="Disabled"></dcx-button>
    <dcx-button loading label="Loading"></dcx-button>
  </section>

  <section class="api">
    <h3>API Reference</h3>
    <!-- Table with props, events, CSS parts -->
  </section>

  <section class="customization">
    <h3>CSS Customization</h3>
    <pre>dcx-button::part(label) { ... }</pre>
  </section>
</section>
```

---

## 7. Out of Scope (Phase 1)

- [ ] Form integration (coming in later phase)
- [ ] Advanced validation (basic required support only)
- [ ] Performance optimization beyond standard Lit
