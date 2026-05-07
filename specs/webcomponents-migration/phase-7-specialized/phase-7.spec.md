# Spec: Phase 7 — Specialized Components

**Phase:** 7  
**Status:** Pending  
**Duration:** 1 week  
**Components:** 3 (Editor, FileUpload, ThemeGenerator)  
**Date Created:** 2026-05-07  
**Week:** 9  

---

## 1. Overview

Migrate 3 specialized utility components from Angular to LitElement WebComponents:

| Component | Angular | WebComponent | Status |
|-----------|---------|--------------|--------|
| Editor | `dcx-ng-editor` | `<dcx-editor>` | Pending |
| FileUpload | `dcx-ng-file-upload` | `<dcx-file-upload>` | Pending |
| ThemeGenerator | `dcx-ng-theme-generator` | `<dcx-theme-generator>` | Pending |

Specialized components provide advanced functionality for specific use cases.

---

## 2. Acceptance Criteria

- [ ] All 3 components migrated to LitElement
- [ ] 90%+ code coverage for each component
- [ ] All tests passing
- [ ] Wiki demo pages created for each component
- [ ] API matches Angular version
- [ ] Accessibility verified (keyboard nav, ARIA attributes)
- [ ] ESLint clean, TypeScript strict
- [ ] CSS customization via `::part()` and CSS variables
- [ ] Build produces no warnings

---

## 3. Components Detail

### 3.1 Editor

**Spec Summary:**
- Rich text editor
- Basic formatting (bold, italic, underline)
- Heading levels (H1-H6)
- Lists (ordered, unordered)
- Link insertion
- Image insertion
- Code block support
- Undo/redo
- Placeholder text
- Disabled state
- Events: `change`, `input`

**API:**
```typescript
interface DcxEditorOptions {
  value?: string;
  placeholder?: string;
  disabled?: boolean;
  toolbar?: boolean;
  height?: string;
  minHeight?: string;
  maxHeight?: string;
  enableFormatting?: string[]; // bold, italic, etc.
  enableLists?: boolean;
  enableLinks?: boolean;
  enableImages?: boolean;
}
```

### 3.2 FileUpload

**Spec Summary:**
- File input with drag-and-drop
- Multiple file selection
- File type filtering
- File size validation
- Upload progress indication
- Uploaded files list
- Remove file capability
- Custom upload handler
- Events: `file-selected`, `file-removed`, `upload-progress`, `upload-complete`

**API:**
```typescript
interface DcxFileUploadOptions {
  accept?: string;
  multiple?: boolean;
  maxSize?: number;
  maxFiles?: number;
  uploadUrl?: string;
  autoUpload?: boolean;
  showProgress?: boolean;
  dragAndDrop?: boolean;
}
```

### 3.3 ThemeGenerator

**Spec Summary:**
- Dynamic theme customization
- Color palette picker
- Font selection
- Spacing scale adjustment
- Border radius customization
- Theme preview live update
- Export theme as CSS variables
- Import/restore defaults
- Theme persistence
- Events: `theme-change`, `theme-export`

**API:**
```typescript
interface DcxThemeGeneratorOptions {
  initialTheme?: {
    primaryColor?: string;
    secondaryColor?: string;
    font?: string;
    spacing?: 'compact' | 'default' | 'spacious';
    borderRadius?: 'sm' | 'md' | 'lg';
  };
  showPreview?: boolean;
  showExport?: boolean;
  allowCustom?: boolean;
}
```

---

## 4. Quality Gates

- [ ] TypeScript strict mode: all components
- [ ] ESLint: 0 errors, 0 warnings
- [ ] Unit test coverage: 90%+ per component
- [ ] Integration tests: file operations, theme application
- [ ] Accessibility: keyboard nav, ARIA attributes
- [ ] No circular dependencies
- [ ] Build time: < 15 seconds
- [ ] Bundle size tracked

---

## 5. Testing Strategy

**Unit Tests:**
- Component rendering
- User interactions (file selection, color picking)
- Data validation
- Event emissions
- Theme persistence

**Accessibility Tests:**
- Keyboard navigation (Tab, Enter, arrow keys)
- ARIA attributes (role, aria-label, aria-description)
- Focus management
- Screen reader announcements

**Integration Tests:**
- File upload workflow
- Theme application across page
- Theme export/import

---

## 6. Wiki Demo Template

Each component gets an interactive demo with all features demonstrated.

---

## 7. Out of Scope

- Server-side upload integration (Phase 9)
- Advanced editor features (table insertion, code highlighting) (Phase 9)
- Theme marketplace/sharing (Phase 9)
