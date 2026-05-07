# Spec: Phase 2 — Selection Components

**Phase:** 2  
**Status:** Pending  
**Duration:** 1 week  
**Components:** 5 (Select, Radio, Icon, IconField, Slider)  
**Date Created:** 2026-05-07  

---

## 1. Overview

Migrate 5 selection and icon-related components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| Select | `dcx-ng-select` | `<dcx-select>` | Pending |
| Radio | `dcx-ng-radio-group` | `<dcx-radio-group>` | Pending |
| Icon | `dcx-ng-icon` | `<dcx-icon>` | Pending |
| IconField | `dcx-ng-icon-field` | `<dcx-icon-field>` | Pending |
| Slider | `dcx-ng-slider` | `<dcx-slider>` | Pending |

---

## 2. Acceptance Criteria

- [ ] All 5 components migrated to LitElement
- [ ] 90%+ code coverage for each component
- [ ] All tests passing
- [ ] Wiki demo pages created for each component
- [ ] API matches Angular version (inputs → properties, outputs → events)
- [ ] Accessibility verified (keyboard nav, ARIA attributes, focus management)
- [ ] ESLint clean, TypeScript strict
- [ ] CSS customization via `::part()` and CSS variables
- [ ] Build produces no warnings

---

## 3. Components Detail

### 3.1 Select

**Spec Summary:**
- Single or multi-select mode
- Options with label/value pairs
- Search/filter functionality
- Disabled state and option-level disable
- Placeholder support
- Events: `change`, `select`, `blur`, `focus`

**API:**
```typescript
interface DcxSelectOption {
  label: string;
  value: string;
  disabled?: boolean;
  icon?: string;
}

interface DcxSelectOptions {
  label?: string;
  placeholder?: string;
  options: DcxSelectOption[];
  value?: string | string[];
  multiple?: boolean;
  disabled?: boolean;
  readonly?: boolean;
  searchable?: boolean;
  clearable?: boolean;
  required?: boolean;
}
```

---

### 3.2 Radio

**Spec Summary:**
- Enhanced radio component from Phase 1 with additional features
- Radio group container
- Inline/vertical layout modes
- Keyboard group navigation (arrow keys)
- Events: `change`, `select`

**API:**
```typescript
interface DcxRadioItem {
  label: string;
  value: string;
  disabled?: boolean;
}

interface DcxRadioGroupOptions {
  items: DcxRadioItem[];
  value?: string;
  disabled?: boolean;
  layout?: 'vertical' | 'inline';
  name?: string;
}
```

---

### 3.3 Icon

**Spec Summary:**
- Display SVG or icon font icons
- Icon sizing (xs, sm, md, lg, xl)
- Icon rotation (0°, 90°, 180°, 270°)
- Colored icons support
- Fallback to text if icon not found

**API:**
```typescript
interface DcxIconOptions {
  name: string;
  size?: 'xs' | 'sm' | 'md' | 'lg' | 'xl';
  rotation?: 0 | 90 | 180 | 270;
  color?: string;
  title?: string;
  ariaLabel?: string;
}
```

---

### 3.4 IconField

**Spec Summary:**
- Wrapper component for form fields with leading/trailing icons
- Compatible with Input, Select, etc
- Icon click support (clickable icons)
- Adjusts padding for icon space
- Icon styling via CSS variables

**API:**
```typescript
interface DcxIconFieldOptions {
  leading?: string;
  trailing?: string;
  leadingClickable?: boolean;
  trailingClickable?: boolean;
}
```

**Events:**
- `dcx-leading-icon-click` — Emitted when leading icon clicked
- `dcx-trailing-icon-click` — Emitted when trailing icon clicked

---

### 3.5 Slider

**Spec Summary:**
- Single or range slider
- Min/max value support
- Step increments
- Disabled state
- Tooltip with current value
- Keyboard control (arrow keys, Home, End)
- Vertical/horizontal orientation
- Events: `input`, `change`, `slide`

**API:**
```typescript
interface DcxSliderOptions {
  min?: number;
  max?: number;
  value?: number | [number, number];
  step?: number;
  disabled?: boolean;
  readonly?: boolean;
  vertical?: boolean;
  range?: boolean;
  label?: string;
  showTooltip?: boolean;
}
```

---

## 4. Quality Gates

**Before proceeding to Phase 3:**
- [ ] 90%+ code coverage for all 5 components
- [ ] All unit tests passing
- [ ] ESLint clean
- [ ] TypeScript strict mode no errors
- [ ] Accessibility checks passed (keyboard nav, ARIA, focus)
- [ ] Wiki demos interactive
- [ ] No console errors
- [ ] Performance: each component < 8KB gzipped

---

## 5. Testing Strategy

Each component needs:
- [ ] Unit tests (Jest + @testing-library/web-components)
- [ ] Accessibility tests (axe-core, keyboard nav, focus trap)
- [ ] Integration tests (component interactions)
- [ ] Event emission tests

Target coverage:
- Statements: 90%+
- Branches: 90%+
- Functions: 90%+
- Lines: 90%+

---

## 6. Wiki Demo Template

Each component gets a demo page:

```html
<section class="component-demo dcx-select-demo">
  <h2>Select Component</h2>
  
  <section class="variants">
    <h3>Modes</h3>
    <dcx-select 
      label="Single Select"
      placeholder="Choose one..."
      .options="${options}">
    </dcx-select>
    <dcx-select 
      label="Multi Select"
      multiple
      placeholder="Choose many..."
      .options="${options}">
    </dcx-select>
  </section>

  <section class="features">
    <h3>Features</h3>
    <dcx-select 
      searchable
      clearable
      placeholder="Searchable...">
    </dcx-select>
  </section>

  <section class="states">
    <h3>States</h3>
    <dcx-select placeholder="Default"></dcx-select>
    <dcx-select disabled placeholder="Disabled"></dcx-select>
  </section>

  <section class="api">
    <h3>API Reference</h3>
    <!-- Table with props, events, CSS parts -->
  </section>

  <section class="customization">
    <h3>CSS Customization</h3>
    <pre>dcx-select::part(trigger) { ... }</pre>
  </section>
</section>
```

---

## 7. Out of Scope (Phase 2)

- [ ] Advanced multi-select features (tag filtering)
- [ ] Combobox component (Phase 3)
- [ ] Time/date specific sliders (Phase 4+)
- [ ] Icon animation (Phase 7+)
- [ ] Virtualization for large lists (Phase 8)
