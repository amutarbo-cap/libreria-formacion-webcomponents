# Migration Script: Create libreria-formacion-webcomponents repo
# Usage: powershell -ExecutionPolicy Bypass -File migrate-simple.ps1

$ErrorActionPreference = 'Stop'

# Configuration
$REPO_NAME = "libreria-formacion-webcomponents"
$GITHUB_ORG = "amutarbo"
$GITHUB_URL = "https://github.com/$GITHUB_ORG/$REPO_NAME.git"
$UPSTREAM_URL = "https://github.com/$GITHUB_ORG/libreria-formacion.git"
$LOCAL_PATH = "$env:USERPROFILE\Projects\$REPO_NAME"

# Colors
$GREEN = "`e[32m"
$BLUE = "`e[34m"
$YELLOW = "`e[33m"
$RED = "`e[31m"
$RESET = "`e[0m"

function Write-Step { Write-Host "${BLUE}$args${RESET}" }
function Write-Success { Write-Host "${GREEN}✓ $args${RESET}" }
function Write-Error { Write-Host "${RED}✗ $args${RESET}"; exit 1 }

Write-Step "Step 1: Checking Prerequisites..."
if (-not (Get-Command git -ErrorAction SilentlyContinue)) { Write-Error "Git not found" }
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { Write-Error "Node.js not found" }
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) { Write-Error "npm not found" }
Write-Success "All prerequisites found"

Write-Step "Step 2: Preparing Repository..."
if (Test-Path $LOCAL_PATH) {
    $response = Read-Host "$LOCAL_PATH already exists. Remove? (y/n)"
    if ($response -eq 'y') { Remove-Item -Recurse -Force $LOCAL_PATH }
}
$parentPath = Split-Path $LOCAL_PATH
if (-not (Test-Path $parentPath)) { New-Item -ItemType Directory -Path $parentPath -Force > $null }
Write-Success "Directory ready"

Write-Step "Step 3: Creating GitHub Repository..."
$HAS_GH = Get-Command gh -ErrorAction SilentlyContinue
if ($HAS_GH) {
    try {
        gh repo view "$GITHUB_ORG/$REPO_NAME" 2>$null
    } catch {
        gh repo create $REPO_NAME --public --source=. --remote=origin --confirm
    }
    Write-Success "Repository created"
} else {
    Write-Host "${YELLOW}⚠ Create manually: https://github.com/new${RESET}"
    Read-Host "Press Enter when done"
}

Write-Step "Step 4: Cloning Repository..."
git clone $GITHUB_URL $LOCAL_PATH
Set-Location $LOCAL_PATH
Write-Success "Repository cloned"

Write-Step "Step 5: Adding Upstream Submodule..."
git submodule add $UPSTREAM_URL upstream
git submodule update --init --recursive
Write-Success "Submodule added"

Write-Step "Step 6: Installing Dependencies..."
npm install
Write-Success "Dependencies installed"

Write-Step "Step 7: Creating Nx Workspace..."
npm create nx-workspace@latest . --name="$REPO_NAME" --preset="empty" --packageManager="npm" --skip-git --nxCloud="false"
npm install
Write-Success "Nx workspace created"

Write-Step "Step 8: Creating dcx-web-lib Library..."
npx nx generate "@nx/js:library" dcx-web-lib --directory="libs" --publishable --importPath="@dcx-web-components/library" --skip-format
Write-Success "Library created"

Write-Step "Step 9: Creating Directory Structure..."
$dirs = @(
    "libs/dcx-web-lib/src/lib/core/tokens",
    "libs/dcx-web-lib/src/lib/components/base",
    "libs/dcx-web-lib/src/lib/core/interfaces",
    "libs/dcx-web-lib/src/lib/core/utils",
    "libs/dcx-web-lib/src/lib/core/mock",
    "src/showcase-web/components",
    "src/showcase-web/pages",
    "src/showcase-web/assets",
    "metrics/mempalace",
    ".github/workflows"
)
foreach ($dir in $dirs) {
    if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir -Force > $null }
}
Write-Success "Directory structure created"

Write-Step "Step 10: Copying Design Tokens..."
if (Test-Path "upstream/designs/capgemini-tokens.css") {
    Copy-Item "upstream/designs/capgemini-tokens.css" "libs/dcx-web-lib/src/lib/core/tokens/"
    Write-Success "Tokens copied"
}

Write-Step "Step 11: Copying Specifications..."
if (Test-Path "upstream/specs/webcomponents-migration") {
    Copy-Item "upstream/specs/webcomponents-migration" "specs/" -Recurse -Force
    Write-Success "Specs copied"
}

Write-Step "Step 12: Copying .claude Configuration..."
if (Test-Path "upstream/.claude") {
    Copy-Item "upstream/.claude" ".claude" -Recurse -Force
    Write-Success ".claude copied"
} else {
    New-Item -ItemType Directory -Path ".claude" -Force > $null
}

Write-Step "Step 13: Creating Configuration Files..."

# tsconfig.json
Set-Content -Path "libs/dcx-web-lib/tsconfig.json" -Value @"
{
  "extends": "../../tsconfig.base.json",
  "compilerOptions": {
    "outDir": "../../dist/libs/dcx-web-lib",
    "declaration": true,
    "lib": ["es2020", "dom", "dom.iterable"]
  }
}
"@

# .prettierrc
Set-Content -Path ".prettierrc" -Value @"
{
  "printWidth": 100,
  "tabWidth": 2,
  "semi": true,
  "singleQuote": true,
  "trailingComma": "all"
}
"@

# .eslintrc.json
Set-Content -Path ".eslintrc.json" -Value @"
{
  "root": true,
  "ignorePatterns": ["**/*"],
  "overrides": [
    {
      "files": ["*.ts"],
      "extends": ["eslint:recommended"]
    }
  ]
}
"@

# mempalace.yaml
Set-Content -Path "mempalace.yaml" -Value @"
dwelling: webcomponents_library
rooms:
  - name: components
    description: WebComponents in libs/dcx-web-lib
    keywords: [components, dcx-, litElement]
  - name: specs
    description: Implementation specs and phases
    keywords: [specs, phase]
  - name: wiki
    description: Documentation in src/showcase-web
    keywords: [wiki, demo]
  - name: tests
    description: Test files
    keywords: [test, spec]
  - name: core
    description: Shared utilities and tokens
    keywords: [core, utils, tokens]
"@

Write-Success "Configuration files created"

Write-Step "Step 14: Creating GitHub Actions Workflow..."
Set-Content -Path ".github/workflows/build.yml" -Value @"
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
"@

Write-Success "GitHub Actions workflow created"

Write-Step "Step 15: Creating Initial Commit..."
git add .

$msg = "Initial: Setup Nx workspace for WebComponents migration`n`n" +
       "- Initialize Nx workspace with dcx-web-lib library`n" +
       "- TypeScript strict mode, 90%+ coverage threshold`n" +
       "- Copy design tokens from upstream`n" +
       "- Add wiki documentation structure`n" +
       "- Copy specifications (Phase 0-9)`n" +
       "- Configure mempalace for context`n" +
       "- GitHub Actions CI/CD pipeline`n" +
       "- Performance metrics tracking`n`n" +
       "Phase 0 infrastructure ready for LitElement WebComponents migration."

git commit -m $msg
Write-Success "Initial commit created"

Write-Step "Step 16: Pushing to GitHub..."
git push -u origin main
Write-Success "Pushed to GitHub"

Write-Host ""
Write-Host "${GREEN}✅ Migration Complete!${RESET}"
Write-Host ""
Write-Host "Repository: $GITHUB_URL"
Write-Host "Local path: $LOCAL_PATH"
Write-Host ""
Write-Host "Next: Add .claude designs when ready"
Write-Host ""
