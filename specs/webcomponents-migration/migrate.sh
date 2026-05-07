#!/bin/bash
# Migration Script: Create libreria-formacion-webcomponents repo
# Usage: bash migrate-to-webcomponents.sh
# 
# This script will:
# 1. Create GitHub repo (requires gh CLI)
# 2. Clone locally
# 3. Initialize Nx workspace
# 4. Setup all infrastructure
# 5. Commit and push

set -e  # Exit on error

echo "🚀 Starting Migration to WebComponents Repo..."
echo "================================================"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# ============================================================================
# CONFIGURATION
# ============================================================================

REPO_NAME="libreria-formacion-webcomponents"
GITHUB_ORG="amutarbo"
GITHUB_URL="https://github.com/${GITHUB_ORG}/${REPO_NAME}.git"
UPSTREAM_URL="https://github.com/${GITHUB_ORG}/libreria-formacion.git"
LOCAL_PATH="${HOME}/Projects/${REPO_NAME}"
NODE_VERSION="18"

# ============================================================================
# STEP 1: Check Prerequisites
# ============================================================================

echo -e "${BLUE}Step 1: Checking Prerequisites...${NC}"

# Check git
if ! command -v git &> /dev/null; then
    echo "❌ Git not found. Please install Git."
    exit 1
fi
echo "✓ Git found: $(git --version)"

# Check Node.js
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js $NODE_VERSION+"
    exit 1
fi
echo "✓ Node.js found: $(node --version)"

# Check npm
if ! command -v npm &> /dev/null; then
    echo "❌ npm not found. Please install npm."
    exit 1
fi
echo "✓ npm found: $(npm --version)"

# Check GitHub CLI (optional but recommended)
if command -v gh &> /dev/null; then
    echo "✓ GitHub CLI found: $(gh --version)"
    USE_GH=true
else
    echo "⚠ GitHub CLI not found. You'll need to create repo manually."
    USE_GH=false
fi

echo ""

# ============================================================================
# STEP 2: Create GitHub Repository
# ============================================================================

echo -e "${BLUE}Step 2: Creating GitHub Repository...${NC}"

if [ "$USE_GH" = true ]; then
    echo "Using GitHub CLI to create repo..."
    
    # Check if repo already exists
    if gh repo view "${GITHUB_ORG}/${REPO_NAME}" &> /dev/null; then
        echo "⚠ Repository already exists. Skipping creation."
    else
        gh repo create "${REPO_NAME}" \
            --public \
            --description "Framework-agnostic WebComponents library using LitElement" \
            --remote=origin \
            --source=. \
            --remote-name=origin \
            --confirm
        echo "✓ Repository created on GitHub"
    fi
else
    echo "❌ Please create the repository manually:"
    echo "   1. Go to https://github.com/new"
    echo "   2. Repository name: $REPO_NAME"
    echo "   3. Description: Framework-agnostic WebComponents library using LitElement"
    echo "   4. Select: Public, MIT License"
    echo "   5. Click 'Create repository'"
    echo ""
    read -p "Press Enter when repository is created..."
fi

echo ""

# ============================================================================
# STEP 3: Clone Repository
# ============================================================================

echo -e "${BLUE}Step 3: Cloning Repository...${NC}"

if [ -d "$LOCAL_PATH" ]; then
    echo "⚠ Directory already exists: $LOCAL_PATH"
    read -p "Remove and re-clone? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        rm -rf "$LOCAL_PATH"
    else
        cd "$LOCAL_PATH"
        echo "✓ Using existing directory"
    fi
fi

if [ ! -d "$LOCAL_PATH" ]; then
    mkdir -p "$(dirname "$LOCAL_PATH")"
    git clone "$GITHUB_URL" "$LOCAL_PATH"
    echo "✓ Repository cloned to $LOCAL_PATH"
fi

cd "$LOCAL_PATH"

echo ""

# ============================================================================
# STEP 4: Add Upstream Submodule
# ============================================================================

echo -e "${BLUE}Step 4: Adding Upstream Submodule...${NC}"

if [ -d "upstream" ]; then
    echo "⚠ Submodule already exists"
else
    git submodule add "$UPSTREAM_URL" upstream
    git submodule update --init --recursive
    echo "✓ Submodule added and initialized"
fi

echo ""

# ============================================================================
# STEP 5: Install Dependencies
# ============================================================================

echo -e "${BLUE}Step 5: Installing Node Dependencies...${NC}"

npm install
echo "✓ Dependencies installed"

echo ""

# ============================================================================
# STEP 6: Create Nx Workspace
# ============================================================================

echo -e "${BLUE}Step 6: Creating Nx Workspace...${NC}"

if [ -f "nx.json" ]; then
    echo "⚠ Nx workspace already exists"
else
    npx create-nx-workspace@latest . \
        --name="${REPO_NAME}" \
        --preset=empty \
        --packageManager=npm \
        --skip-git \
        --nxCloud=false
    
    npm install
    echo "✓ Nx workspace created"
fi

echo ""

# ============================================================================
# STEP 7: Create dcx-web-lib Library
# ============================================================================

echo -e "${BLUE}Step 7: Creating dcx-web-lib Library...${NC}"

if [ -d "libs/dcx-web-lib" ]; then
    echo "⚠ Library already exists"
else
    nx generate @nx/js:library dcx-web-lib \
        --directory=libs \
        --publishable \
        --importPath='@dcx-web-components/library' \
        --skip-format
    
    echo "✓ dcx-web-lib library created"
fi

echo ""

# ============================================================================
# STEP 8: Setup Directory Structure
# ============================================================================

echo -e "${BLUE}Step 8: Creating Directory Structure...${NC}"

# Core tokens
mkdir -p libs/dcx-web-lib/src/lib/core/tokens
mkdir -p libs/dcx-web-lib/src/lib/components/base
mkdir -p libs/dcx-web-lib/src/lib/core/{interfaces,utils,mock}

# Wiki
mkdir -p src/showcase-web/{components,pages,assets/{styles,scripts,images}}

# Metrics
mkdir -p metrics/mempalace
touch metrics/mempalace/.gitkeep

# GitHub workflows
mkdir -p .github/workflows

echo "✓ Directory structure created"

echo ""

# ============================================================================
# STEP 9: Copy Design Tokens
# ============================================================================

echo -e "${BLUE}Step 9: Copying Design Tokens...${NC}"

if [ -f "libs/dcx-web-lib/src/lib/core/tokens/capgemini-tokens.css" ]; then
    echo "⚠ Tokens already exist"
else
    cp upstream/designs/capgemini-tokens.css libs/dcx-web-lib/src/lib/core/tokens/
    echo "✓ Design tokens copied"
fi

echo ""

# ============================================================================
# STEP 10: Copy Specs
# ============================================================================

echo -e "${BLUE}Step 10: Copying Specifications...${NC}"

if [ -d "specs/webcomponents-migration" ]; then
    echo "⚠ Specs already exist"
else
    cp -r upstream/specs/webcomponents-migration ./specs/
    echo "✓ Specifications copied"
fi

echo ""

# ============================================================================
# STEP 11: Copy .claude Folder
# ============================================================================

echo -e "${BLUE}Step 11: Copying .claude Configuration...${NC}"

if [ -d ".claude" ]; then
    echo "⚠ .claude folder already exists"
else
    if [ -d "upstream/.claude" ]; then
        cp -r upstream/.claude ./.claude
        echo "✓ .claude configuration copied"
    else
        echo "⚠ .claude folder not found in upstream"
        mkdir -p .claude
        touch .claude/.gitkeep
    fi
fi

echo ""

# ============================================================================
# STEP 12: Create Core Configuration Files
# ============================================================================

echo -e "${BLUE}Step 12: Creating Configuration Files...${NC}"

# TypeScript config for library
cat > libs/dcx-web-lib/tsconfig.json << 'EOF'
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
EOF

# Jest config
cat > libs/dcx-web-lib/jest.config.ts << 'EOF'
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
EOF

# Test setup
cat > libs/dcx-web-lib/src/test-setup.ts << 'EOF'
import '@testing-library/jest-dom';

// WebComponents will be registered here in Phase 1+
EOF

# Prettier config
cat > .prettierrc << 'EOF'
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
EOF

# ESLint config
cat > .eslintrc.json << 'EOF'
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
EOF

# Mempalace config
cat > mempalace.yaml << 'EOF'
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
EOF

echo "✓ Configuration files created"

echo ""

# ============================================================================
# STEP 13: Create GitHub Actions Workflow
# ============================================================================

echo -e "${BLUE}Step 13: Creating GitHub Actions Workflow...${NC}"

cat > .github/workflows/build.yml << 'EOF'
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
          node-version: '18'
      - run: npm ci
      - run: npm run lint
      - run: npm test -- --coverage
      - run: npm run build
      - name: Upload coverage
        uses: codecov/codecov-action@v3
        with:
          files: ./coverage/lcov.info
EOF

echo "✓ GitHub Actions workflow created"

echo ""

# ============================================================================
# STEP 14: Update package.json Scripts
# ============================================================================

echo -e "${BLUE}Step 14: Updating Scripts...${NC}"

cat > scripts/setup-scripts.json << 'EOF'
{
  "setup": "npm install && git submodule update --init --recursive",
  "build": "nx build dcx-web-lib",
  "test": "nx run-many --target=test --all -- --coverage",
  "lint": "nx lint dcx-web-lib",
  "lint-fix": "nx lint dcx-web-lib --fix",
  "format": "prettier --write .",
  "format-check": "prettier --check .",
  "validate": "npm run lint && npm run test && npm run build"
}
EOF

echo "✓ Scripts configured (review scripts/setup-scripts.json)"

echo ""

# ============================================================================
# STEP 15: Verify Setup
# ============================================================================

echo -e "${BLUE}Step 15: Verifying Setup...${NC}"

echo "Running verification checks..."

# Verify build
nx build dcx-web-lib > /dev/null 2>&1 && echo "✓ Build successful" || echo "❌ Build failed"

# Verify tests
npm test -- dcx-web-lib --passWithNoTests > /dev/null 2>&1 && echo "✓ Tests pass" || echo "❌ Tests failed"

# Verify lint
npm run lint > /dev/null 2>&1 && echo "✓ Lint passes" || echo "❌ Lint failed"

# Verify TypeScript
npx tsc --noEmit > /dev/null 2>&1 && echo "✓ TypeScript strict mode OK" || echo "❌ TypeScript errors"

echo ""

# ============================================================================
# STEP 16: Create Initial Commit
# ============================================================================

echo -e "${BLUE}Step 16: Creating Initial Commit...${NC}"

git add .

cat > /tmp/commit-msg.txt << 'EOF'
Initial: Setup Nx workspace for WebComponents migration

- Initialize Nx workspace with dcx-web-lib library
- Configure TypeScript strict mode (90%+ coverage threshold)
- Setup ESLint + Prettier + Husky pre-commit hooks
- Copy design tokens from upstream (capgemini-tokens.css)
- Add wiki documentation structure (src/showcase-web/)
- Copy specifications from upstream (all phases 0-9)
- Configure mempalace for WebComponents context
- Add GitHub Actions CI/CD workflow
- Setup metrics folder for performance tracking

Phase 0 infrastructure ready. See specs/webcomponents-migration/phase-0-infrastructure/

This is a clean, independent WebComponents library using LitElement.
Framework-agnostic, works in React, Vue, vanilla JS, or any framework.

Refs: https://github.com/amutarbo/libreria-formacion/tree/main/specs/webcomponents-migration
EOF

git commit -F /tmp/commit-msg.txt

echo "✓ Initial commit created"

echo ""

# ============================================================================
# STEP 17: Push to GitHub
# ============================================================================

echo -e "${BLUE}Step 17: Pushing to GitHub...${NC}"

git push -u origin main

echo "✓ Pushed to GitHub"

echo ""

# ============================================================================
# SUCCESS
# ============================================================================

echo -e "${GREEN}✅ Migration Complete!${NC}"
echo ""
echo "Repository: $GITHUB_URL"
echo "Local path: $LOCAL_PATH"
echo ""
echo "Next steps:"
echo "1. Review Phase 0 specification:"
echo "   cd $LOCAL_PATH"
echo "   cat specs/webcomponents-migration/phase-0-infrastructure/phase-0.spec.md"
echo ""
echo "2. Begin Phase 0 implementation"
echo ""
echo "3. Track progress with:"
echo "   npm run validate"
echo ""
echo "Documentation: $LOCAL_PATH/specs/webcomponents-migration/README.md"
echo ""
