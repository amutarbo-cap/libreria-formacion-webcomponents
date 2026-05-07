# Guía: Migración a Nuevo Repo (libreria-formacion-webcomponents)

**Fecha:** 2026-05-07  
**Status:** Ready to Execute  
**Duration:** 2-4 horas  

---

## 📋 Pre-requisitos

- [ ] GitHub account with push access
- [ ] Git configured locally
- [ ] Node.js 18+ installed
- [ ] npm 9+ installed
- [ ] Nx CLI global: `npm install -g nx`

---

## 🚀 Step 1: Create GitHub Repository

### 1.1 Create on GitHub UI

Go to https://github.com/new

```
Repository name: libreria-formacion-webcomponents
Description: Framework-agnostic WebComponents library using LitElement
Visibility: Public
.gitignore: Node
License: MIT
```

**Do NOT initialize with README** (we'll add it)

### 1.2 Verify Created
- [ ] Repository exists: `github.com/amutarbo/libreria-formacion-webcomponents`
- [ ] URL: `https://github.com/amutarbo/libreria-formacion-webcomponents.git`

---

## 🖥️ Step 2: Clone & Setup Local Repository

### 2.1 Clone
```bash
cd ~/Projects  # or your projects folder
git clone https://github.com/amutarbo/libreria-formacion-webcomponents.git
cd libreria-formacion-webcomponents
```

### 2.2 Verify
```bash
git status
# On branch main
# No commits yet
```

---

## 🔗 Step 3: Add Upstream Submodule (Reference to Angular Repo)

### 3.1 Add Submodule
```bash
git submodule add https://github.com/amutarbo/libreria-formacion.git upstream
```

This creates:
- `.gitmodules` file
- `upstream/` folder pointing to libreria-formacion

### 3.2 Initialize Submodule
```bash
git submodule update --init --recursive
```

### 3.3 Verify
```bash
ls -la upstream/
# Should see: designs/, specs/, mempalace.yaml, etc.

cat .gitmodules
# [submodule "upstream"]
#   path = upstream
#   url = https://github.com/amutarbo/libreria-formacion.git
```

---

## 📂 Step 4: Initialize Nx Workspace

### 4.1 Create Workspace
```bash
# Interactive setup
npm create nx-workspace@latest . \
  --name=libreria-formacion-webcomponents \
  --preset=empty \
  --packageManager=npm \
  --no-interactive

# Or use wizard:
npm create nx-workspace@latest
```

**Selections:**
- Workspace name: `libreria-formacion-webcomponents`
- Preset: `empty`
- Package manager: `npm`
- Enable cloud: `no` (for now)

### 4.2 Verify Files Created
```bash
ls -la
# nx.json
# package.json
# tsconfig.base.json
# .eslintrc.json
# etc.

git status
# should show untracked workspace files
```

### 4.3 Install Dependencies
```bash
npm install
```

Takes ~2-3 minutes first time.

---

## 📚 Step 5: Create dcx-web-lib Library

### 5.1 Generate Library
```bash
nx generate @nx/js:library dcx-web-lib \
  --directory=libs \
  --publishable \
  --importPath=@dcx-web-components/library
```

**This creates:**
- `libs/dcx-web-lib/` folder
- `libs/dcx-web-lib/src/lib/`
- `libs/dcx-web-lib/src/index.ts`
- `libs/dcx-web-lib/project.json`

### 5.2 Verify Build
```bash
nx build dcx-web-lib
# ✔  1 file(s) emitted.
```

### 5.3 Verify Tests
```bash
npm test -- dcx-web-lib
# No tests found, but Jest configured
```

---

## 🎨 Step 6: Copy Design Tokens

### 6.1 Create Tokens Folder
```bash
mkdir -p libs/dcx-web-lib/src/lib/core/tokens
```

### 6.2 Copy Tokens from Upstream
```bash
# Option A: Direct copy
cp upstream/designs/capgemini-tokens.css libs/dcx-web-lib/src/lib/core/tokens/

# Option B: Symlink (if on macOS/Linux)
ln -s ../../upstream/designs/capgemini-tokens.css libs/dcx-web-lib/src/lib/core/tokens/capgemini-tokens.css
```

### 6.3 Create Token Distribution Files
```bash
# These will be created in Phase 0
touch libs/dcx-web-lib/src/lib/core/tokens/{colors,typography,spacing,shadows,transitions}.css
```

### 6.4 Verify
```bash
ls libs/dcx-web-lib/src/lib/core/tokens/
# capgemini-tokens.css
# colors.css
# typography.css
# spacing.css
# shadows.css
# transitions.css
```

---

## 📖 Step 7: Setup Wiki Custom Documentation Site

### 7.1 Create Wiki Structure
```bash
mkdir -p src/showcase-web/{components,pages,assets/{styles,scripts,images}}
```

### 7.2 Create Base Files
```bash
# Home page
touch src/showcase-web/index.html

# Component pages (template)
touch src/showcase-web/components/demo-template.html

# Documentation pages
touch src/showcase-web/pages/{migration-guide,performance,api-reference}.html

# Styles
touch src/showcase-web/assets/styles/{main,theme}.css

# Scripts
touch src/showcase-web/assets/scripts/{nav,search}.ts
```

### 7.3 Verify Structure
```bash
tree src/showcase-web/
# src/showcase-web/
# ├── index.html
# ├── components/
# │   └── demo-template.html
# ├── pages/
# │   ├── migration-guide.html
# │   ├── performance.html
# │   └── api-reference.html
# └── assets/
#     ├── styles/
#     │   ├── main.css
#     │   └── theme.css
#     └── scripts/
#         ├── nav.ts
#         └── search.ts
```

---

## 📋 Step 8: Copy Specs

### 8.1 Copy Phase Specs
```bash
cp -r upstream/specs/webcomponents-migration ./specs/

# This copies:
# specs/webcomponents-migration/
# ├── README.md
# ├── webcomponents-master.spec.md
# ├── phase-0-infrastructure/
# ├── phase-1-core-components/
# ├── phase-2-selection/
# ... (through phase-9-release)
```

### 8.2 Verify Specs
```bash
ls specs/webcomponents-migration/phase-*/
# Should see all 9 phase folders with spec.md, tasks.md, checklist.md
```

---

## 🔧 Step 9: Configure TypeScript (Strict Mode)

### 9.1 Update `libs/dcx-web-lib/tsconfig.json`
```json
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "strictFunctionTypes": true,
    "strictPropertyInitialization": true,
    "noImplicitThis": true,
    "alwaysStrict": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "noImplicitReturns": true,
    "noFallthroughCasesInSwitch": true,
    "declaration": true,
    "declarationMap": true,
    "sourceMap": true,
    "outDir": "../../dist/libs/dcx-web-lib"
  }
}
```

### 9.2 Verify
```bash
npx tsc --noEmit
# Should pass with no errors (0 components at this stage)
```

---

## 🧪 Step 10: Configure Jest (90% Coverage)

### 10.1 Create `libs/dcx-web-lib/jest.config.ts`
```typescript
import type { Config } from 'jest';

const config: Config = {
  displayName: 'dcx-web-lib',
  preset: '../../jest.preset.js',
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['<rootDir>/src/test-setup.ts'],
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx'],
  coverageDirectory: '../../coverage/libs/dcx-web-lib',
  coverageThresholds: {
    global: {
      branches: 90,
      functions: 90,
      lines: 90,
      statements: 90,
    },
  },
};

export default config;
```

### 10.2 Create `libs/dcx-web-lib/src/test-setup.ts`
```typescript
import '@testing-library/jest-dom';

// Mock for customElements
if (!customElements.get('dcx-button')) {
  // WebComponents will be registered here in Phase 1+
}
```

### 10.3 Verify
```bash
npm test -- dcx-web-lib
# PASS  libs/dcx-web-lib
# No tests yet (0 tests)
```

---

## 📐 Step 11: Configure ESLint + Prettier

### 11.1 Create `.eslintrc.json` (root)
```json
{
  "root": true,
  "ignorePatterns": ["**/*"],
  "overrides": [
    {
      "files": ["*.ts"],
      "extends": [
        "eslint:recommended",
        "plugin:@typescript-eslint/recommended"
      ],
      "rules": {
        "no-console": ["warn", { "allow": ["warn", "error"] }],
        "prefer-const": "error",
        "no-var": "error",
        "@typescript-eslint/no-explicit-any": "error"
      }
    }
  ]
}
```

### 11.2 Create `.prettierrc`
```json
{
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "singleQuote": true,
  "trailingComma": "all",
  "bracketSpacing": true,
  "arrowParens": "always"
}
```

### 11.3 Setup Husky Pre-commit
```bash
npm install husky --save-dev
npx husky install

# Add pre-commit hook
npx husky add .husky/pre-commit "npm run lint-staged"
```

### 11.4 Update `package.json` Scripts
```json
{
  "scripts": {
    "lint": "nx lint dcx-web-lib",
    "lint-fix": "nx lint dcx-web-lib --fix",
    "lint-staged": "lint-staged",
    "format": "prettier --write .",
    "format-check": "prettier --check ."
  },
  "lint-staged": {
    "*.{ts,tsx}": ["eslint --fix", "prettier --write"],
    "*.{json,md}": ["prettier --write"]
  }
}
```

### 11.5 Verify
```bash
npm run lint
# ✔  All files pass linting
```

---

## 💾 Step 12: Setup Mempalace (WC-specific)

### 12.1 Create `mempalace.yaml`
```yaml
dwelling: webcomponents_library
rooms:
  - name: components
    description: WebComponents in libs/dcx-web-lib
    keywords:
      - components
      - dcx-
      - litElement
      - webcomponents
  - name: specs
    description: Implementation specs and phases
    keywords:
      - specs
      - phase
      - requirements
  - name: wiki
    description: Documentation and demos in src/showcase-web
    keywords:
      - wiki
      - demo
      - documentation
  - name: tests
    description: Test files and coverage
    keywords:
      - test
      - spec
      - coverage
      - jest
  - name: core
    description: Shared utilities, tokens, interfaces
    keywords:
      - core
      - utils
      - tokens
      - interfaces
```

### 12.2 Create `mempalace-daily.ps1` Script
```powershell
param(
    [string]$Query,
    [int]$BaselineTokens
)

# Run mempalace analysis
$wakeText = mempalace wake-up | Out-String
$searchText = mempalace search $Query | Out-String

# Save metrics to metrics/mempalace/
$dateStamp = Get-Date -Format 'yyyy-MM-dd-HHmmss'
$outputPath = "metrics/mempalace/analysis-$dateStamp-$Query.json"

@{
    timestamp = $dateStamp
    query = $Query
    baseline = $BaselineTokens
    wake_tokens = $wakeText.Length / 4
    search_tokens = $searchText.Length / 4
} | ConvertTo-Json | Out-File $outputPath

Write-Output "Analysis saved: $outputPath"
```

### 12.3 Create Metrics Folder
```bash
mkdir -p metrics/mempalace
touch metrics/mempalace/.gitkeep
```

---

## 📄 Step 13: Create Root Documentation

### 13.1 Create `README.md`
```markdown
# DCX Web Components Library

Framework-agnostic WebComponents library built with LitElement.

## Quick Start

\`\`\`bash
npm install @dcx-web-components/library
\`\`\`

## Development

\`\`\`bash
# Install dependencies
npm install

# Local development
npm run start

# Run tests
npm test

# Build
npm run build
\`\`\`

## Architecture

- **Components**: 37+ WebComponents in `libs/dcx-web-lib/`
- **Wiki**: Interactive documentation in `src/showcase-web/`
- **Specs**: Implementation phases in `specs/webcomponents-migration/`
- **Design System**: Capgemini tokens from upstream repo

## Related Projects

- [libreria-formacion](https://github.com/amutarbo/libreria-formacion) - Angular version

## License

MIT
\`\`\`

### 13.2 Create `CONTRIBUTING.md`
```markdown
# Contributing

## Development Workflow

1. Check [Phase Specs](./specs/webcomponents-migration/)
2. Create component in `libs/dcx-web-lib/src/lib/components/`
3. Add tests (90%+ coverage required)
4. Create wiki demo in `src/showcase-web/components/`
5. Run validation: \`npm run validate\`
6. Submit PR

## Code Standards

- TypeScript strict mode
- ESLint + Prettier required
- 90%+ test coverage
- Accessibility (WCAG 2.1 AA)
- Semantic HTML5
\`\`\`

### 13.3 Create `.github/workflows/build.yml`
```yaml
name: Build

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main, develop]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '18'
      - run: npm ci
      - run: npm run lint
      - run: npm test -- --coverage
      - run: npm run build
      - name: Report coverage
        uses: codecov/codecov-action@v3
        with:
          files: ./coverage/lcov.info
```

---

## ✅ Step 14: Commit Initial Setup

### 14.1 Add All Files
```bash
git add .
```

### 14.2 Commit
```bash
git commit -m "Initial: Setup Nx workspace with WebComponents structure

- Initialize Nx workspace with dcx-web-lib library
- Configure TypeScript strict mode (90% coverage)
- Setup ESLint + Prettier
- Copy design tokens from upstream
- Add wiki documentation structure
- Configure mempalace for WebComponents context
- Add GitHub Actions CI/CD workflow

Refs: specs/webcomponents-migration/phase-0"
```

### 14.3 Push
```bash
git push -u origin main
```

### 14.4 Verify
```bash
# Check GitHub repo
# Should see all files pushed
```

---

## 🎯 Verification Checklist

- [ ] Repository exists on GitHub
- [ ] Submodule points to libreria-formacion
- [ ] Nx workspace initialized
- [ ] `dcx-web-lib` library created
- [ ] `npm install` succeeds
- [ ] `nx build dcx-web-lib` succeeds
- [ ] `npm test` runs (0 tests)
- [ ] `npm run lint` passes
- [ ] `npx tsc --noEmit` passes
- [ ] Wiki folder structure created
- [ ] Specs copied and accessible
- [ ] mempalace.yaml configured
- [ ] GitHub Actions workflow running
- [ ] Initial commit pushed to main

---

## 📚 Next Steps

1. ✅ **Repo Migration Complete**
2. → **Phase 0 Execution** (Setup in new repo)
3. → **Phase 1-9** (Component implementation)

---

## 🆘 Troubleshooting

### Submodule not updating
```bash
git submodule update --init --recursive
git submodule update --remote
```

### Build fails with TypeScript errors
```bash
npx tsc --noEmit --listFiles
# Check for type errors
```

### Jest coverage not working
```bash
npm test -- --coverage --collectCoverageFrom="src/**/*.ts"
```

### ESLint issues
```bash
npm run lint-fix
npx prettier --write .
```

---

**Status:** Ready to Execute  
**Estimated Time:** 2-4 hours  
**Next Review:** After repo migration complete
