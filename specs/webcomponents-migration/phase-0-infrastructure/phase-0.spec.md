# Spec: Phase 0 — Infrastructure & Setup

**Phase:** 0  
**Status:** Pending  
**Duration:** 1 week  
**Date Created:** 2026-05-07  

---

## 1. Overview

Prepare the development environment and infrastructure for WebComponents migration:
- Create new Nx workspace
- Configure TypeScript, Jest, ESLint
- Set up component base template
- Migrate design tokens (CSS variables)
- Bootstrap Wiki documentation site

This is the foundation for all subsequent phases.

---

## 2. Acceptance Criteria

- [ ] New repository created and initialized
- [ ] Nx workspace configured with dcx-web-lib project
- [ ] TypeScript strict mode enabled
- [ ] Jest configured with 90% coverage threshold
- [ ] ESLint configured for WebComponents conventions
- [ ] Base LitElement component template created
- [ ] CSS tokens migrated from `designs/capgemini-tokens.css`
- [ ] Shared utilities/core folder created
- [ ] Wiki custom site scaffolded with base layout
- [ ] CI/CD pipeline initialized (GitHub Actions)
- [ ] Build produces clean artifacts
- [ ] All tests pass (0 tests at this stage)

---

## 3. Deliverables

### 3.1 Repository Setup
- [ ] Create GitHub repository: `libreria-formacion-webcomponents`
- [ ] Clone and initialize locally
- [ ] Add `.gitignore`, `README.md`, `LICENSE`

### 3.2 Nx Workspace
- [ ] Install Nx globally: `npm install -g nx`
- [ ] Create workspace: `npm create nx-workspace@latest`
  - Workspace name: `libreria-formacion-webcomponents`
  - Package manager: `npm`
  - Preset: `web-components` or `empty`
- [ ] Create library: `nx generate @nx/js:library dcx-web-lib`

### 3.3 TypeScript Configuration
- [ ] `tsconfig.base.json` — Root config
- [ ] `libs/dcx-web-lib/tsconfig.json` — Library config (strict mode)
- [ ] `libs/dcx-web-lib/tsconfig.spec.json` — Test config
- [ ] Enable all strict options:
  ```json
  {
    "compilerOptions": {
      "strict": true,
      "noImplicitAny": true,
      "strictNullChecks": true,
      "strictFunctionTypes": true
    }
  }
  ```

### 3.4 Dependencies
Install:
```json
{
  "lit": "^3.0.0",
  "@lit/react": "^1.0.0",
  "@testing-library/web-components": "^0.0.30",
  "@open-wc/testing": "^4.0.0",
  "jest": "^29.0.0",
  "@types/jest": "^29.0.0"
}
```

### 3.5 Build Configuration
- [ ] `libs/dcx-web-lib/project.json` — Nx project config
- [ ] Build output: `dist/libs/dcx-web-lib/`
- [ ] Targets: `build`, `test`, `lint`, `serve`

### 3.6 Jest Setup
- [ ] `jest.config.ts` — Root config
- [ ] `jest.preset.js` — Preset for web components
- [ ] Coverage threshold: 90% (enforced)
- [ ] Test setup file configured

### 3.7 ESLint Configuration
- [ ] `eslint.config.js` — Root ESLint config
- [ ] Rules for TypeScript + WebComponents
- [ ] Prettier integration for auto-formatting
- [ ] Pre-commit hooks (Husky)

### 3.8 Base Component Template
Create `libs/dcx-web-lib/src/lib/components/base/`:
- [ ] `lit-element.base.ts` — Base class template with:
  - Property decorators
  - Event emissions
  - Accessibility patterns
- [ ] `styles.template.ts` — CSS template helper

### 3.9 Token Migration
- [ ] Read `designs/capgemini-tokens.css` from this repo
- [ ] Create `libs/dcx-web-lib/src/lib/core/tokens/`:
  - [ ] `tokens.css` — CSS variables
  - [ ] `colors.css` — Color palette
  - [ ] `typography.css` — Font sizes, weights
  - [ ] `spacing.css` — Padding, margins, gaps
  - [ ] `shadows.css` — Box shadows
  - [ ] `transitions.css` — Animation durations

### 3.10 Shared Utilities
Create `libs/dcx-web-lib/src/lib/core/`:
- [ ] `interfaces/` — Shared types and enums
- [ ] `utils/` — Helper functions
- [ ] `mock/` — Mock data for testing
- [ ] `index.ts` — Barrel exports

### 3.11 Wiki Setup
Create `src/showcase-web/`:
- [ ] Basic HTML structure
  - [ ] `index.html` — Home page
  - [ ] `components.html` — Components index
  - [ ] `performance.html` — Performance dashboard (template)
  - [ ] `migration-guide.html` — Migration guide (template)
- [ ] CSS setup
  - [ ] `assets/styles/main.css` — Base styles
  - [ ] `assets/styles/theme.css` — Light/dark theme
- [ ] JavaScript
  - [ ] `assets/scripts/nav.ts` — Navigation system
  - [ ] `assets/scripts/search.ts` — Search functionality
- [ ] Component template folder
  - [ ] `components/demo-template.html` — Reusable demo template

### 3.12 CI/CD Pipeline
- [ ] `.github/workflows/build.yml` — Build on push
- [ ] `.github/workflows/test.yml` — Tests on push
- [ ] `.github/workflows/deploy-wiki.yml` — Wiki deployment to GitHub Pages

### 3.13 Documentation
- [ ] `README.md` — Project overview
- [ ] `CONTRIBUTING.md` — Contribution guidelines
- [ ] `docs/setup.md` — Local development setup
- [ ] `docs/component-template.md` — How to create new component

---

## 4. Validation Checklist

At the end of Phase 0, validate:

- [ ] Repo created and cloned
- [ ] `npm install` succeeds
- [ ] `nx build dcx-web-lib` succeeds
- [ ] `npm test` runs (0 tests, 0 failures)
- [ ] `npm run lint` passes
- [ ] TypeScript: `npx tsc --noEmit` (no errors)
- [ ] Wiki loads at `http://localhost:3000/`
- [ ] Base component template can be copied
- [ ] All CSS tokens accessible as variables
- [ ] GitHub Actions workflows trigger on push

---

## 5. Performance Targets (Phase 0)

- Build time: < 10 seconds
- TypeScript check: < 5 seconds
- Lint: < 5 seconds

---

## 6. Out of Scope (Phase 0)

- [ ] Component implementation (starts Phase 1)
- [ ] Component tests (starts Phase 1)
- [ ] Wiki component demos (starts Phase 1)
- [ ] Performance benchmarking (Phase 8)
