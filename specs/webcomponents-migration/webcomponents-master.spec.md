# Spec: WebComponents Migration with LitElement (Master)

**Status:** Approved  
**Date:** 2026-05-07  
**Repository:** `libreria-formacion-webcomponents` (new, separate)  
**Duration:** 11 weeks  
**Goal:** Transform DCX NG Library (37+ Angular components) → DCX Web Library (LitElement WebComponents)

---

## 1. Overview

### What & Why?
Migrate all 37+ Angular components from DCX NG Library to **framework-agnostic LitElement WebComponents**:
- ✅ Decoupled from Angular versions
- ✅ Works in React, Vue, vanilla JS, any framework
- ✅ 60% smaller bundle
- ✅ 66% faster load time
- ✅ 90%+ test coverage

### Key Decisions
| Decision | Why |
|----------|-----|
| **Separate repo** | Independent lifecycle, clean separation of concerns |
| **LitElement** | Lightweight, performant, standards-based |
| **Wiki custom** | Full control, integrated performance dashboard |
| **90%+ coverage** | Strict quality threshold |
| **Modern browsers** | ES2020+, no polyfills |
| **External CSS** | Better caching, easier maintenance |
| **CSS ::part()** | Allow customization across Shadow DOM |
| **No Storybook** | Reduce dependencies, use custom Wiki instead |

### Output
- 📦 `@dcx-web-components/library` NPM package
- 📄 Interactive Wiki documentation with performance dashboard
- 📊 60% bundle savings vs Angular version
- ✅ 90%+ code coverage

---

## 2. Architecture at a Glance

### Component Pattern (LitElement)
```typescript
import { LitElement, html, css } from 'lit';
import { property, state } from 'lit/decorators.js';

export class DcxButton extends LitElement {
  static styles = [buttonStyles];  // External CSS

  @property({ type: String })
  label = '';

  @property({ type: Boolean })
  disabled = false;

  handleClick() {
    this.dispatchEvent(new CustomEvent('dcx-clicked'));
  }

  render() {
    return html`
      <button
        class="dcx-button"
        ?disabled="${this.disabled}"
        @click="${this.handleClick}"
      >
        ${this.label}
      </button>
    `;
  }
}

customElements.define('dcx-button', DcxButton);
```

### Styling Pattern
```typescript
// dcx-button.styles.ts
import { css } from 'lit';

export const buttonStyles = css`
  :host {
    --dcx-button-bg: var(--background-primary, #0058ab);
    --dcx-button-color: var(--content-on-primary, #fff);
  }

  .dcx-button {
    background: var(--dcx-button-bg);
    color: var(--dcx-button-color);
    padding: var(--dcx-button-padding, 8px 16px);
  }

  .dcx-button::part(label) {
    font-weight: var(--dcx-button-label-weight, 500);
  }
`;
```

### Wiki Component Demo
```html
<section class="component-demo">
  <h2>Button Component</h2>
  <dcx-button label="Click me"></dcx-button>
  
  <h3>API</h3>
  <table>
    <tr><td>label</td><td>string</td></tr>
    <tr><td>disabled</td><td>boolean</td></tr>
  </table>
  
  <h3>CSS Customization</h3>
  <pre>dcx-button::part(label) { ... }</pre>
</section>
```

---

## 3. Repository Structure

### New Repo: `libreria-formacion-webcomponents`
```
├── libs/dcx-web-lib/
│   ├── src/lib/
│   │   ├── components/
│   │   │   ├── dcx-button/
│   │   │   │   ├── dcx-button.ts
│   │   │   │   ├── dcx-button.styles.ts
│   │   │   │   └── dcx-button.test.ts
│   │   │   └── ... (37+ components)
│   │   └── core/
│   │       ├── interfaces/
│   │       └── utils/
│   └── jest.config.ts
├── src/showcase-web/
│   ├── components/
│   ├── pages/
│   │   ├── home.html
│   │   ├── migration-guide.html
│   │   └── performance.html
│   └── assets/
├── specs/webcomponents-migration/
│   ├── README.md (index)
│   ├── webcomponents-master.spec.md (this file)
│   └── phase-X/ (0-9)
├── package.json
├── nx.json
└── tsconfig.base.json
```

---

## 4. Timeline (11 weeks)

| Phase | Duration | Focus | Components |
|-------|----------|-------|-----------|
| **0** | 1 | Infrastructure & setup | — |
| **1** | 2 | Core: Button, Input, Checkbox | 6 |
| **2** | 1 | Selection: Select, Radio, Toggle | 5 |
| **3** | 1 | Containers: Card, Tabs, Accordion | 6 |
| **4** | 1 | Overlays: Dialog, Toast, Tooltip | 7 |
| **5** | 1 | Data: Table, Paginator, DatePicker | 6 |
| **6** | 1 | Navigation: Navbar, Breadcrumb | 4 |
| **7** | 1 | Specialized: Editor, FileUpload | 3 |
| **8** | 1 | Performance Analysis & Dashboard | — |
| **9** | 1 | Documentation & Release | — |
| **Total** | **11** | **37+ components + Wiki** | **37+** |

---

## 5. Quality Gates (Each Phase)

Must pass **all** before proceeding:
- ✅ **90%+ code coverage**
- ✅ **All tests green**
- ✅ **ESLint clean**
- ✅ **TypeScript strict mode**
- ✅ **Accessibility checks** (keyboard nav, ARIA)
- ✅ **Wiki demos working**
- ✅ **No breaking changes** from Angular version

---

## 6. Success Metrics

| Metric | Target | Expected |
|--------|--------|----------|
| Bundle size reduction | 40-60% | ~60% |
| Components migrated | 37+ | ✅ 37+ |
| Code coverage | 90%+ | ✅ 90%+ |
| Initial load time | Faster | 66% faster |
| Memory footprint | Lower | 62% lower |
| Browser support | Modern only | Chrome/Firefox/Safari/Edge v2 latest |

---

## 7. Related Documents

- **Phase 0-9 Specs** — Individual phase specifications with tasks & checklists
- **Wiki Setup Spec** — Custom documentation site setup
- **Angular Lib (this repo)** — Unchanged; maintain separately

---

## 8. Next Steps

1. ✅ Review this master spec
2. ✅ Create new GitHub repository: `libreria-formacion-webcomponents`
3. ✅ Initialize Nx workspace (see Phase 0 spec)
4. ✅ Begin Phase 0 setup
