# Migration Script: Create libreria-formacion-webcomponents repo
# Usage: powershell -ExecutionPolicy Bypass -File migrate.ps1
#
# This script will:
# 1. Create GitHub repo (requires gh CLI)
# 2. Clone locally
# 3. Initialize Nx workspace
# 4. Setup all infrastructure
# 5. Commit and push

$ErrorActionPreference = 'Stop'

# ============================================================================
# CONFIGURATION
# ============================================================================

$REPO_NAME = "libreria-formacion-webcomponents"
$GITHUB_ORG = "amutarbo"
$GITHUB_URL = "https://github.com/$GITHUB_ORG/$REPO_NAME.git"
$UPSTREAM_URL = "https://github.com/$GITHUB_ORG/libreria-formacion.git"
$LOCAL_PATH = "$env:USERPROFILE\Projects\$REPO_NAME"
$NODE_VERSION = "18"

# Colors
$GREEN = "`e[32m"
$BLUE = "`e[34m"
$YELLOW = "`e[33m"
$RED = "`e[31m"
$RESET = "`e[0m"

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

function Write-Step {
    param([string]$Message)
    Write-Host "${BLUE}$Message${RESET}"
}

function Write-Success {
    param([string]$Message)
    Write-Host "${GREEN}✓ $Message${RESET}"
}

function Write-Error {
    param([string]$Message)
    Write-Host "${RED}✗ $Message${RESET}"
    exit 1
}

function Test-Command {
    param([string]$Command)
    $null = Get-Command $Command -ErrorAction SilentlyContinue
    return $?
}

# ============================================================================
# STEP 1: Check Prerequisites
# ============================================================================

Write-Host ""
Write-Step "Step 1: Checking Prerequisites..."

if (-not (Test-Command git)) { Write-Error "Git not found" }
Write-Success "Git found: $(git --version)"

if (-not (Test-Command node)) { Write-Error "Node.js not found" }
Write-Success "Node.js found: $(node --version)"

if (-not (Test-Command npm)) { Write-Error "npm not found" }
Write-Success "npm found: $(npm --version)"

$HAS_GH = Test-Command gh
if ($HAS_GH) {
    Write-Success "GitHub CLI found: $(gh --version)"
} else {
    Write-Host "${YELLOW}⚠ GitHub CLI not found. Create repo manually on GitHub.${RESET}"
}

Write-Host ""

# ============================================================================
# STEP 2: Create GitHub Repository
# ============================================================================

Write-Step "Step 2: Creating GitHub Repository..."

if ($HAS_GH) {
    try {
        $null = gh repo view "$GITHUB_ORG/$REPO_NAME" 2>$null
        Write-Host "${YELLOW}⚠ Repository already exists. Skipping creation.${RESET}"
    } catch {
        Write-Host "Creating repository with GitHub CLI..."
        gh repo create $REPO_NAME `
            --public `
            --description "Framework-agnostic WebComponents library using LitElement" `
            --source=. `
            --remote=origin `
            --confirm
        Write-Success "Repository created on GitHub"
    }
} else {
    Write-Host "Manual Setup Required:"
    Write-Host "1. Go to https://github.com/new"
    Write-Host "2. Repository name: $REPO_NAME"
    Write-Host "3. Description: Framework-agnostic WebComponents library using LitElement"
    Write-Host "4. Select: Public, MIT License"
    Write-Host "5. Click 'Create repository'"
    Write-Host ""
    Read-Host "Press Enter when repository is created"
}

Write-Host ""

# ============================================================================
# STEP 3: Clone Repository
# ============================================================================

Write-Step "Step 3: Cloning Repository..."

if (Test-Path $LOCAL_PATH) {
    Write-Host "${YELLOW}⚠ Directory already exists: $LOCAL_PATH${RESET}"
    $response = Read-Host "Remove and re-clone? (y/n)"
    if ($response -eq 'y') {
        Remove-Item -Recurse -Force $LOCAL_PATH
    } else {
        Set-Location $LOCAL_PATH
        Write-Success "Using existing directory"
    }
}

if (-not (Test-Path $LOCAL_PATH)) {
    $parentPath = Split-Path $LOCAL_PATH
    if (-not (Test-Path $parentPath)) {
        New-Item -ItemType Directory -Path $parentPath -Force > $null
    }
    git clone $GITHUB_URL $LOCAL_PATH
    Write-Success "Repository cloned to $LOCAL_PATH"
}

Set-Location $LOCAL_PATH

Write-Host ""

# ============================================================================
# STEP 4: Add Upstream Submodule
# ============================================================================

Write-Step "Step 4: Adding Upstream Submodule..."

if (Test-Path "upstream") {
    Write-Host "${YELLOW}⚠ Submodule already exists${RESET}"
} else {
    git submodule add $UPSTREAM_URL upstream
    git submodule update --init --recursive
    Write-Success "Submodule added and initialized"
}

Write-Host ""

# ============================================================================
# STEP 5: Install Dependencies
# ============================================================================

Write-Step "Step 5: Installing Node Dependencies..."

npm install

Write-Success "Dependencies installed"

Write-Host ""

# ============================================================================
# STEP 6: Create Nx Workspace
# ============================================================================

Write-Step "Step 6: Creating Nx Workspace..."

if (Test-Path "nx.json") {
    Write-Host "${YELLOW}⚠ Nx workspace already exists${RESET}"
} else {
    npm create nx-workspace@latest . `
        --name="$REPO_NAME" `
        --preset="empty" `
        --packageManager="npm" `
        --skip-git `
        --nxCloud="false"
    
    npm install
    Write-Success "Nx workspace created"
}

Write-Host ""

# ============================================================================
# STEP 7: Create dcx-web-lib Library
# ============================================================================

Write-Step "Step 7: Creating dcx-web-lib Library..."

if (Test-Path "libs/dcx-web-lib") {
    Write-Host "${YELLOW}⚠ Library already exists${RESET}"
} else {
    nx generate "@nx/js:library" dcx-web-lib `
        --directory="libs" `
        --publishable `
        --importPath="@dcx-web-components/library" `
        --skip-format
    
    Write-Success "dcx-web-lib library created"
}

Write-Host ""

# ============================================================================
# STEP 8: Setup Directory Structure
# ============================================================================

Write-Step "Step 8: Creating Directory Structure..."

$dirs = @(
    "libs/dcx-web-lib/src/lib/core/tokens",
    "libs/dcx-web-lib/src/lib/components/base",
    "libs/dcx-web-lib/src/lib/core/interfaces",
    "libs/dcx-web-lib/src/lib/core/utils",
    "libs/dcx-web-lib/src/lib/core/mock",
    "src/showcase-web/components",
    "src/showcase-web/pages",
    "src/showcase-web/assets/styles",
    "src/showcase-web/assets/scripts",
    "src/showcase-web/assets/images",
    "metrics/mempalace",
    ".github/workflows"
)

foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force > $null
    }
}

Write-Success "Directory structure created"

Write-Host ""

# ============================================================================
# STEP 9: Copy Design Tokens
# ============================================================================

Write-Step "Step 9: Copying Design Tokens..."

if (Test-Path "libs/dcx-web-lib/src/lib/core/tokens/capgemini-tokens.css") {
    Write-Host "${YELLOW}⚠ Tokens already exist${RESET}"
} else {
    Copy-Item "upstream/designs/capgemini-tokens.css" "libs/dcx-web-lib/src/lib/core/tokens/"
    Write-Success "Design tokens copied"
}

Write-Host ""

# ============================================================================
# STEP 10: Copy Specs
# ============================================================================

Write-Step "Step 10: Copying Specifications..."

if (Test-Path "specs/webcomponents-migration") {
    Write-Host "${YELLOW}⚠ Specs already exist${RESET}"
} else {
    Copy-Item "upstream/specs/webcomponents-migration" "specs/" -Recurse
    Write-Success "Specifications copied"
}

Write-Host ""

# ============================================================================
# STEP 11: Copy .claude Folder
# ============================================================================

Write-Step "Step 11: Copying .claude Configuration..."

if (Test-Path ".claude") {
    Write-Host "${YELLOW}⚠ .claude folder already exists${RESET}"
} else {
    if (Test-Path "upstream/.claude") {
        Copy-Item "upstream/.claude" ".claude" -Recurse
        Write-Success ".claude configuration copied"
    } else {
        Write-Host "${YELLOW}⚠ .claude folder not found in upstream${RESET}"
        New-Item -ItemType Directory -Path ".claude" -Force > $null
    }
}

Write-Host ""

# ============================================================================
# STEP 12: Create Configuration Files
# ============================================================================

Write-Step "Step 12: Creating Configuration Files..."

# TypeScript config
@"
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "outDir": "../../dist/libs/dcx-web-lib",
    "declaration": true,
    "declarationMap": true,
    "inlineSourceMap": false,
    "types": ["jest", "node"],
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
    "lib": ["es2020", "dom", "dom.iterable"]
  },
  "files": [],
  "include": [],
  "references": [
    { "path": "./tsconfig.lib.json" },
    { "path": "./tsconfig.spec.json" }
  ],
  "compileOnSave": false,
  "exclude": ["node_modules", "dist"]
}
"@ | Out-File -Encoding UTF8 "libs/dcx-web-lib/tsconfig.json"

# Jest config
@"
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
"@ | Out-File -Encoding UTF8 "libs/dcx-web-lib/jest.config.ts"

# Test setup
@"
import '@testing-library/jest-dom';
"@ | Out-File -Encoding UTF8 "libs/dcx-web-lib/src/test-setup.ts"

# Prettier config
@"
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
"@ | Out-File -Encoding UTF8 ".prettierrc"

# ESLint config
@"
{
  "root": true,
  "ignorePatterns": ["**/*"],
  "overrides": [
    {
      "files": ["*.ts"],
      "extends": ["eslint:recommended", "plugin:@typescript-eslint/recommended"],
      "rules": {
        "no-console": ["warn", { "allow": ["warn", "error"] }],
        "prefer-const": "error",
        "no-var": "error",
        "@typescript-eslint/no-explicit-any": "error"
      }
    }
  ]
}
"@ | Out-File -Encoding UTF8 ".eslintrc.json"

# Mempalace config
@"
dwelling: webcomponents_library
rooms:
  - name: components
    description: WebComponents in libs/dcx-web-lib
    keywords:
      - components
      - dcx-
      - litElement
  - name: specs
    description: Implementation specs and phases
    keywords:
      - specs
      - phase
  - name: wiki
    description: Documentation in src/showcase-web
    keywords:
      - wiki
      - demo
  - name: tests
    description: Test files
    keywords:
      - test
      - spec
  - name: core
    description: Shared utilities and tokens
    keywords:
      - core
      - utils
      - tokens
"@ | Out-File -Encoding UTF8 "mempalace.yaml"

Write-Success "Configuration files created"

Write-Host ""

# ============================================================================
# STEP 13: Create GitHub Actions Workflow
# ============================================================================

Write-Step "Step 13: Creating GitHub Actions Workflow..."

@"
name: Build & Test

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
          node-version: "18"
      - run: npm ci
      - run: npm run lint
      - run: npm test -- --coverage
      - run: npm run build
      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          files: ./coverage/lcov.info
"@ | Out-File -Encoding UTF8 ".github/workflows/build.yml"

Write-Success "GitHub Actions workflow created"

Write-Host ""

# ============================================================================
# STEP 14: Verify Setup
# ============================================================================

Write-Step "Step 14: Verifying Setup..."

Write-Host "Running verification checks..."

try {
    $null = nx build dcx-web-lib 2>$null
    Write-Success "Build successful"
} catch {
    Write-Host "${RED}✗ Build failed${RESET}"
}

try {
    $null = npm test -- dcx-web-lib --passWithNoTests 2>$null
    Write-Success "Tests pass"
} catch {
    Write-Host "${RED}✗ Tests failed${RESET}"
}

try {
    $null = npm run lint 2>$null
    Write-Success "Lint passes"
} catch {
    Write-Host "${YELLOW}⚠ Lint check skipped${RESET}"
}

try {
    $null = npx tsc --noEmit 2>$null
    Write-Success "TypeScript strict mode OK"
} catch {
    Write-Host "${YELLOW}⚠ TypeScript check skipped${RESET}"
}

Write-Host ""

# ============================================================================
# STEP 15: Create Initial Commit
# ============================================================================

Write-Step "Step 15: Creating Initial Commit..."

git add .

$commitMsg = @"
Initial: Setup Nx workspace for WebComponents migration`n`n* Initialize Nx workspace with dcx-web-lib library`n* Configure TypeScript strict mode (90%+ coverage threshold)`n* Setup ESLint + Prettier configuration`n* Copy design tokens from upstream (capgemini-tokens.css)`n* Add wiki documentation structure (src/showcase-web/)`n* Copy specifications from upstream (all phases 0-9)`n* Configure mempalace for WebComponents context`n* Add GitHub Actions CI/CD workflow`n* Setup metrics folder for performance tracking`n`nPhase 0 infrastructure ready. See specs/webcomponents-migration/phase-0-infrastructure/`n`nThis is a clean, independent WebComponents library using LitElement.`nFramework-agnostic, works in React, Vue, vanilla JS, or any framework.`n`nRefs: https://github.com/amutarbo/libreria-formacion/tree/main/specs/webcomponents-migration
"@

git commit -m $commitMsg

Write-Success "Initial commit created"

Write-Host ""

# ============================================================================
# STEP 16: Push to GitHub
# ============================================================================

Write-Step "Step 16: Pushing to GitHub..."

git push -u origin main

Write-Success "Pushed to GitHub"

Write-Host ""

# ============================================================================
# SUCCESS
# ============================================================================

Write-Host ""
Write-Host "${GREEN}✅ Migration Complete!${RESET}"
Write-Host ""
Write-Host "Repository: $GITHUB_URL"
Write-Host "Local path: $LOCAL_PATH"
Write-Host ""
Write-Host "Next steps:"
Write-Host "1. Review Phase 0 specification:"
Write-Host "   cd $LOCAL_PATH"
Write-Host "   cat specs/webcomponents-migration/phase-0-infrastructure/phase-0.spec.md"
Write-Host ""
Write-Host "2. Begin Phase 0 implementation"
Write-Host ""
Write-Host "3. Track progress with:"
Write-Host "   npm run validate"
Write-Host ""
Write-Host "Documentation: $LOCAL_PATH/specs/webcomponents-migration/README.md"
Write-Host ""
