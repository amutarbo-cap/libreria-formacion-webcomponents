# WebComponents Migration Project

**Status:** Planning  
**Repository:** `libreria-formacion-webcomponents` (separate repo)  
**Duration:** 11 weeks  
**Goal:** Migrate 37+ Angular components to LitElement WebComponents

---

## 📚 Documentation Structure

This folder contains specifications for the WebComponents migration project. Each phase has:

- **`phase-X.spec.md`** — Detailed specification for the phase
- **`phase-X.tasks.md`** — Breakdown of tasks and implementation steps
- **`phase-X.checklist.md`** — Validation checklist before moving to next phase

### Master Specifications

- **[webcomponents-master.spec.md](webcomponents-master.spec.md)** — Overall architecture & strategy
- **[wiki-setup.spec.md](wiki-setup.spec.md)** — Wiki custom documentation setup

### Phase Specs

| Phase | Duration | Focus | Files |
|-------|----------|-------|-------|
| **Phase 0** | 1 week | Infrastructure & Setup | [spec](phase-0-infrastructure/phase-0.spec.md) • [tasks](phase-0-infrastructure/phase-0.tasks.md) • [check](phase-0-infrastructure/phase-0.checklist.md) |
| **Phase 1** | 2 weeks | Core Components (Button, Input, etc) | [spec](phase-1-core-components/phase-1.spec.md) • [tasks](phase-1-core-components/phase-1.tasks.md) • [check](phase-1-core-components/phase-1.checklist.md) |
| **Phase 2** | 1 week | Selection (Select, Radio, Toggle) | [spec](phase-2-selection/phase-2.spec.md) • [tasks](phase-2-selection/phase-2.tasks.md) • [check](phase-2-selection/phase-2.checklist.md) |
| **Phase 3** | 1 week | Containers (Card, Tabs, Accordion) | [spec](phase-3-containers/phase-3.spec.md) • [tasks](phase-3-containers/phase-3.tasks.md) • [check](phase-3-containers/phase-3.checklist.md) |
| **Phase 4** | 1 week | Overlays (Dialog, Tooltip, Toast) | [spec](phase-4-overlays/phase-4.spec.md) • [tasks](phase-4-overlays/phase-4.tasks.md) • [check](phase-4-overlays/phase-4.checklist.md) |
| **Phase 5** | 1 week | Data (Table, Paginator, DatePicker) | [spec](phase-5-data/phase-5.spec.md) • [tasks](phase-5-data/phase-5.tasks.md) • [check](phase-5-data/phase-5.checklist.md) |
| **Phase 6** | 1 week | Navigation (Navbar, Breadcrumb) | [spec](phase-6-navigation/phase-6.spec.md) • [tasks](phase-6-navigation/phase-6.tasks.md) • [check](phase-6-navigation/phase-6.checklist.md) |
| **Phase 7** | 1 week | Specialized (Editor, FileUpload) | [spec](phase-7-specialized/phase-7.spec.md) • [tasks](phase-7-specialized/phase-7.tasks.md) • [check](phase-7-specialized/phase-7.checklist.md) |
| **Phase 8** | 1 week | Performance Analysis & Dashboard | [spec](phase-8-performance/phase-8.spec.md) • [tasks](phase-8-performance/phase-8.tasks.md) • [check](phase-8-performance/phase-8.checklist.md) |
| **Phase 9** | 1 week | Documentation & Release | [spec](phase-9-release/phase-9.spec.md) • [tasks](phase-9-release/phase-9.tasks.md) • [check](phase-9-release/phase-9.checklist.md) |

---

## 🚀 Quick Start

### For the new repository

```bash
# Create new repo
mkdir libreria-formacion-webcomponents
cd libreria-formacion-webcomponents
git init

# Copy this specs/ folder structure
# Copy package.json template (see below)

# Install dependencies
npm install

# Start Phase 0
npm run phase:0
```

### For this repository (libreria-formacion)

Keep unchanged:
- `libs/dcx-ng-lib/` — Angular components library
- `src/app/` — Angular showcase app
- Existing workflows

Add to README.md:
```markdown
## Related Projects

- **[libreria-formacion-webcomponents](https://github.com/...webcomponents)** — WebComponents version with LitElement
  - Framework-agnostic components
  - 60% smaller bundle
  - Custom Wiki documentation
  - Check out for modern browser projects!
```

---

## 🎯 Key Decisions

| Decision | Rationale |
|----------|-----------|
| **Separate repo** | Independent lifecycle, CI/CD, and npm packages |
| **LitElement** | Lightweight, performant, standards-based |
| **Wiki custom** | Full control, no Storybook overhead, integrated perf dashboard |
| **90%+ coverage** | Strict quality threshold |
| **Modern browsers** | ES2020+, no polyfills |
| **External CSS** | Better caching and maintenance |
| **CSS ::part()** | Allow customization across Shadow DOM |

---

## 📊 Success Metrics

- ✅ **37+ components** migrated
- ✅ **90%+ code coverage**
- ✅ **60% bundle reduction** vs Angular
- ✅ **66% faster load time**
- ✅ **Wiki with performance dashboard** deployed
- ✅ **NPM package** published

---

## 📖 How to Use These Specs

1. **Start with** [webcomponents-master.spec.md](webcomponents-master.spec.md) for context
2. **Review Phase 0 spec** and get approval
3. **Execute Phase 0 tasks** using [phase-0.tasks.md](phase-0-infrastructure/phase-0.tasks.md)
4. **Validate with** [phase-0.checklist.md](phase-0-infrastructure/phase-0.checklist.md)
5. **Move to next phase** and repeat

---

## 🔗 Repository Setup

**New repository structure:**

```
libreria-formacion-webcomponents/
├── libs/
│   └── dcx-web-lib/              # WebComponents library
│       ├── src/
│       │   └── lib/
│       │       └── components/   # 37+ components
│       └── jest.config.ts
├── src/
│   └── showcase-web/             # Wiki custom documentation
│       ├── components/
│       ├── pages/
│       └── assets/
├── specs/                        # Copy from here
│   └── webcomponents-migration/
├── package.json                  # New workspace
├── nx.json                       # Nx config
└── tsconfig.base.json
```

---

## 📝 Next Steps

1. ✅ Approve master spec
2. ✅ Create new GitHub repository: `libreria-formacion-webcomponents`
3. ✅ Initialize with Nx + package.json (see templates below)
4. ✅ Begin Phase 0 setup
