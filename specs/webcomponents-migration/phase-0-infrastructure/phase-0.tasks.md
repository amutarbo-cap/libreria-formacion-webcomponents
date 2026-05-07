# Phase 0 — Tasks & Implementation

**Phase:** 0  
**Status:** Pending  
**Total Tasks:** 13  
**Estimated Time:** 40 hours (1 week)  

---

## Task Breakdown

### Day 1-2: Repository & Nx Setup

- [ ] **Task 0.1** — Create GitHub repository `libreria-formacion-webcomponents`
  - [ ] Initialize with Node `.gitignore`
  - [ ] Add MIT LICENSE
  - [ ] Add initial README.md
  - **Time:** 1 hour

- [ ] **Task 0.2** — Clone repository and create Nx workspace
  - [ ] Run: `npm create nx-workspace@latest libreria-formacion-webcomponents`
  - [ ] Select: `empty` preset
  - [ ] Commit initial Nx setup
  - **Time:** 2 hours
  - **Deliverable:** `nx.json`, `workspace.json`, `package.json` configured

- [ ] **Task 0.3** — Create `dcx-web-lib` library with Nx
  - [ ] Run: `nx generate @nx/js:library dcx-web-lib --publishable`
  - [ ] Configure: `libs/dcx-web-lib/project.json`
  - [ ] Verify builds: `nx build dcx-web-lib`
  - **Time:** 2 hours
  - **Deliverable:** Library structure ready

### Day 2-3: TypeScript & Build Configuration

- [ ] **Task 0.4** — Configure TypeScript (strict mode)
  - [ ] Update `libs/dcx-web-lib/tsconfig.json`
  - [ ] Set `"strict": true` and all related options
  - [ ] Verify with: `npx tsc --noEmit`
  - **Time:** 2 hours
  - **Deliverable:** Strict TypeScript configured

- [ ] **Task 0.5** — Configure Jest for 90% coverage
  - [ ] Create `libs/dcx-web-lib/jest.config.ts`
  - [ ] Set coverage threshold: `90`
  - [ ] Create `test-setup.ts` for WebComponents
  - [ ] Verify: `npm test -- dcx-web-lib`
  - **Time:** 2 hours
  - **Deliverable:** Jest ready with coverage reporting

- [ ] **Task 0.6** — Set up ESLint + Prettier
  - [ ] Create `.eslintrc.json` (WebComponents rules)
  - [ ] Create `.prettierrc` (formatting config)
  - [ ] Add Husky pre-commit hooks
  - [ ] Test: `npm run lint` & `npm run lint-fix`
  - **Time:** 2 hours
  - **Deliverable:** Code quality tools configured

### Day 3-4: Dependencies & Base Templates

- [ ] **Task 0.7** — Install WebComponents dependencies
  - [ ] Install LitElement, testing libraries
  - [ ] Run: `npm install`
  - [ ] Verify no errors: `npm list`
  - **Time:** 1 hour
  - **Deliverable:** package.json updated with all deps

- [ ] **Task 0.8** — Create base component template
  - [ ] Create `libs/dcx-web-lib/src/lib/components/base/`
  - [ ] Create `lit-element.base.ts` with:
    - [ ] Property decorators template
    - [ ] Event emission examples
    - [ ] Accessibility helpers
  - [ ] Create `styles.template.ts` with CSS template
  - **Time:** 3 hours
  - **Deliverable:** Template components can be copy-pasted for new components

- [ ] **Task 0.9** — Migrate design tokens
  - [ ] Read from: `designs/capgemini-tokens.css` (this repo)
  - [ ] Create: `libs/dcx-web-lib/src/lib/core/tokens/`
  - [ ] Create separate CSS files for:
    - [ ] `tokens.css` (base variables)
    - [ ] `colors.css`
    - [ ] `typography.css`
    - [ ] `spacing.css`
    - [ ] `shadows.css`
    - [ ] `transitions.css`
  - [ ] Verify all tokens accessible in components
  - **Time:** 3 hours
  - **Deliverable:** All design tokens converted

- [ ] **Task 0.10** — Create shared utilities/core
  - [ ] Create `core/interfaces/` folder
    - [ ] Base types for all components
  - [ ] Create `core/utils/` folder
    - [ ] Helper functions (DOM, accessibility, etc)
  - [ ] Create `core/mock/` folder
    - [ ] Mock data templates
  - [ ] Create `core/index.ts` barrel export
  - **Time:** 2 hours
  - **Deliverable:** Shared utilities ready for Phase 1

### Day 4-5: Wiki & CI/CD

- [ ] **Task 0.11** — Set up Wiki custom documentation site
  - [ ] Create `src/showcase-web/` folder structure
  - [ ] Create base HTML files:
    - [ ] `index.html` (home page)
    - [ ] `components.html` (component index)
    - [ ] `performance.html` (template)
    - [ ] `migration-guide.html` (template)
  - [ ] Create `assets/styles/`:
    - [ ] `main.css` (base styles)
    - [ ] `theme.css` (light/dark)
  - [ ] Create `assets/scripts/`:
    - [ ] `nav.ts` (navigation)
    - [ ] `search.ts` (search functionality)
  - [ ] Create component demo template
  - **Time:** 4 hours
  - **Deliverable:** Wiki structure ready, home page loads

- [ ] **Task 0.12** — Set up CI/CD pipelines
  - [ ] Create `.github/workflows/build.yml`
    - [ ] Build on every push
    - [ ] Run tests
    - [ ] Report coverage
  - [ ] Create `.github/workflows/test.yml`
    - [ ] Run Jest tests
    - [ ] Enforce 90% coverage
  - [ ] Create `.github/workflows/deploy-wiki.yml`
    - [ ] Deploy Wiki to GitHub Pages
  - **Time:** 2 hours
  - **Deliverable:** GitHub Actions workflows active

- [ ] **Task 0.13** — Create documentation
  - [ ] Write `README.md` (project overview)
  - [ ] Write `CONTRIBUTING.md` (contribution guidelines)
  - [ ] Write `docs/setup.md` (local development)
  - [ ] Write `docs/component-template.md` (create new component guide)
  - **Time:** 2 hours
  - **Deliverable:** Documentation complete

---

## Daily Standup Notes

**Use these templates:**

```markdown
### Day N Standup

**Completed:**
- [ ] Task X.Y — Description

**In Progress:**
- [ ] Task A.B — Description

**Blockers:**
- Issue: ...
- Resolution: ...

**Next Day Plan:**
- [ ] Task X.Y
```

---

## Phase 0 Sign-off

**By end of Phase 0, ensure:**

```
[ ] All 13 tasks completed
[ ] Build: `nx build dcx-web-lib` ✅
[ ] Test: `npm test` ✅
[ ] Lint: `npm run lint` ✅
[ ] TypeScript: `npx tsc --noEmit` ✅
[ ] Wiki home page loads ✅
[ ] CI/CD pipelines trigger ✅
[ ] Base component template working ✅
[ ] All design tokens accessible ✅
```

**Sign-off by:** [Team lead]  
**Date:** [Date]
