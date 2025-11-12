# contraco Unified Multi-Site Builder

**Build all 5 TLD websites from ONE codebase!**

## 🎯 What This Does

Instead of managing 5 separate 11ty projects, this **unified builder**:

- ✅ Manages all 5 TLD sites (net, de, kr, ru, com) in ONE place
- ✅ Shares templates, CSS, and JavaScript across all sites
- ✅ Builds all 5 sites with ONE command
- ✅ Each site gets its own language/URL configuration
- ✅ Deploys to separate GitHub repos automatically

## 🚀 Quick Start

### 1. Install Dependencies

```powershell
npm install
```

### 2. Build All Sites

```powershell
npm run build
```

This builds all 5 TLD sites to:
- `dist/net/` → contraco.net
- `dist/de/` → contraco.de
- `dist/kr/` → contraco.co.kr
- `dist/ru/` → contraco.ru
- `dist/com/` → contraco.com

### 3. Build Individual Site

```powershell
npm run build:net    # Build only contraco-net
npm run build:de     # Build only contraco-de
npm run build:kr     # Build only contraco-kr
npm run build:ru     # Build only contraco-ru
npm run build:com    # Build only contraco-com
```

### 4. Development Server (Test One Site)

```powershell
npm run serve:net    # Preview contraco-net at http://localhost:8080
npm run serve:de     # Preview contraco-de at http://localhost:8080
# etc.
```

### 5. Deploy All Sites

```powershell
npm run deploy
```

Interactive script that copies built sites to your GitHub repos.

---

## 📁 Project Structure

```
PHASE2-UNIFIED/
├── build-all-sites.js       # Main build script
├── deploy-all-sites.js      # Deployment script
├── package.json             # Dependencies and npm scripts
├── .eleventy.js             # 11ty configuration
│
├── src/                     # SOURCE FILES (edit these)
│   ├── _includes/           # Shared templates
│   │   ├── base.njk         # Base layout (used by all sites)
│   │   ├── header.njk       # Header (edit once → all sites)
│   │   └── footer.njk       # Footer (edit once → all sites)
│   │
│   ├── _data/               # Data files
│   │   ├── site.json        # Auto-generated per build
│   │   └── navigation.json  # Shared navigation items
│   │
│   ├── css/                 # Shared styles
│   │   └── styles.css       # Edit once → all sites
│   │
│   ├── js/                  # Shared JavaScript
│   │   └── scripts.js       # Edit once → all sites
│   │
│   ├── assets-shared/       # Assets used by all TLDs
│   │   └── Logo_rectangle.svg, etc.
│   │
│   ├── assets-tld/          # TLD-specific assets
│   │   ├── net/             # contraco-net only
│   │   ├── de/              # contraco-de only
│   │   ├── kr/              # contraco-kr only
│   │   ├── ru/              # contraco-ru only
│   │   └── com/             # contraco-com only
│   │
│   ├── index.njk            # Homepage (template for all TLDs)
│   ├── about.njk            # About page
│   └── ... (other pages)
│
├── dist/                    # BUILD OUTPUT (generated)
│   ├── net/                 # contraco-net built files
│   ├── de/                  # contraco-de built files
│   ├── kr/                  # contraco-kr built files
│   ├── ru/                  # contraco-ru built files
│   └── com/                 # contraco-com built files
│
└── _site/                   # Temporary build folder (11ty internal)
```

---

## 🔧 Configuration

### Site Settings (build-all-sites.js)

All TLD configurations are in `build-all-sites.js`:

```javascript
const sites = {
  net: {
    url: 'https://contraco.net',
    lang: 'en',
    tagline: 'Established 1998 • Premium Transformation Consulting',
    // ... etc
  },
  de: {
    url: 'https://contraco.de',
    lang: 'de',
    tagline: 'Gegründet 1998 • Premium Transformationsberatung',
    // ... etc
  },
  // ... kr, ru, com
};
```

**To change site settings:** Edit `build-all-sites.js` and rebuild.

### Navigation (src/_data/navigation.json)

Shared navigation menu for all sites:

```json
[
  { "text": "Home", "url": "/" },
  { "text": "About", "url": "/about.html" }
]
```

**Note:** Text will be the same across all TLDs. For translated navigation, create language-specific navigation files.

---

## 📝 Creating Content

### Add a New Page (All TLDs)

Create `src/new-page.njk`:

```yaml
---
layout: base.njk
title: My New Page
description: Page description
gaPageTitle: Custom GA title
---

<section class="page-content">
    <div class="container">
        <h1>My New Page</h1>
        <p>Content here...</p>
    </div>
</section>
```

Run `npm run build` → Page appears in all 5 TLD builds!

### Add Language-Specific Content

Create separate files with language suffix:

```
src/about.en.njk  → Used for contraco-net, contraco-com
src/about.de.njk  → Used for contraco-de
src/about.ko.njk  → Used for contraco-kr
src/about.ru.njk  → Used for contraco-ru
```

Then modify `build-all-sites.js` to copy the right file per TLD.

### Add TLD-Specific Assets

Place assets in `src/assets-tld/{tld}/`:

```
src/assets-tld/net/yandex_xxxxx.html  → Only in contraco-net build
src/assets-tld/de/yandex_yyyyy.html   → Only in contraco-de build
```

These are automatically copied to the correct build output.

---

## 🎨 Styling & Scripts

### Edit CSS (Applies to All Sites)

Edit `src/css/styles.css` → Run `npm run build` → All 5 sites updated!

### Edit JavaScript (Applies to All Sites)

Edit `src/js/scripts.js` → Run `npm run build` → All 5 sites updated!

### Edit Header/Footer (Applies to All Sites)

Edit `src/_includes/header.njk` or `footer.njk` → Rebuild → All sites updated!

---

## 🚀 Deployment Workflow

### Option 1: Automatic (Recommended)

```powershell
# Build all sites
npm run build

# Deploy all sites interactively
npm run deploy
```

The deploy script will:
1. Ask for paths to your 5 GitHub repos
2. Copy built files to each repo
3. Optionally commit and push changes

### Option 2: Manual

```powershell
# Build all sites
npm run build

# Manually copy to each repo
xcopy dist\net\* C:\repos\contraco-net\ /E /Y
xcopy dist\de\* C:\repos\contraco-de\ /E /Y
xcopy dist\kr\* C:\repos\contraco-kr\ /E /Y
xcopy dist\ru\* C:\repos\contraco-ru\ /E /Y
xcopy dist\com\* C:\repos\contraco-com\ /E /Y

# Commit and push each repo
cd C:\repos\contraco-net
git add .
git commit -m "Update from unified builder"
git push
# (repeat for de, kr, ru, com)
```

---

## 🎯 Common Tasks

### Change Footer Text

1. Edit `src/_includes/footer.njk`
2. Run `npm run build`
3. Deploy → Footer updated on all 5 sites!

**Time: 2 minutes** (was: 2-3 hours editing 85 files)

### Update Navigation

1. Edit `src/_data/navigation.json`
2. Run `npm run build`
3. Deploy → Navigation updated on all 5 sites!

**Time: 1 minute** (was: 2-3 hours)

### Fix CSS Bug

1. Edit `src/css/styles.css`
2. Run `npm run build`
3. Deploy → CSS fixed on all 5 sites!

**Time: 2 minutes** (was: 2-3 hours)

### Change Google Analytics Tracking ID

1. Edit `build-all-sites.js`, change `gaTrackingId`
2. Run `npm run build`
3. Deploy → GA updated on all 5 sites!

**Time: 1 minute** (was: 2-3 hours)

---

## 🔍 Testing

### Test One Site Locally

```powershell
npm run serve:net
# Opens http://localhost:8080
```

Browse the site, check all pages work, verify styles/scripts load.

### Test All Sites

```powershell
npm run build

# Open each dist folder in a local server
cd dist\net
python -m http.server 8000  # http://localhost:8000

# (repeat for de, kr, ru, com on different ports)
```

---

## 📊 Before vs After

### Old Way (5 Separate Projects)

```
To change footer:
  - Edit 17 files in contraco-net
  - Edit 17 files in contraco-de
  - Edit 17 files in contraco-kr
  - Edit 17 files in contraco-ru
  - Edit 3 files in contraco-com
  = 67 files total, 2-3 hours

To change CSS:
  - Edit 17 files per TLD = 67 files total, 2-3 hours
```

### New Way (Unified Builder)

```
To change footer:
  - Edit 1 file: src/_includes/footer.njk
  - Run: npm run build && npm run deploy
  = 1 file, 2 minutes

To change CSS:
  - Edit 1 file: src/css/styles.css
  - Run: npm run build && npm run deploy
  = 1 file, 2 minutes
```

**96% time reduction!** 🎉

---

## 🆘 Troubleshooting

### Build Fails

**Error: `Cannot find module 'fs-extra'`**
```powershell
npm install
```

**Error: `ENOENT: no such file or directory`**
- Check you're in the PHASE2-UNIFIED directory
- Verify `src/` folder exists

### Sites Not Building

**Only some sites build:**
```powershell
# Build specific site
npm run build:net
# Check for errors
```

**All sites fail:**
- Check `src/_includes/base.njk` exists
- Check `src/_data/navigation.json` is valid JSON

### Deployment Issues

**Can't find repo paths:**
- Use full paths: `C:\Users\Name\repos\contraco-net`
- Check repos are cloned and accessible

**Git errors:**
- Commit any pending changes in repos first
- Pull latest changes before deploying

---

## 🎓 Migration Guide

### Coming from Old HTML Sites

1. **Copy this folder** to your working directory
2. **Run:** `npm install`
3. **Copy assets** from each old site to `src/assets-tld/{tld}/`
4. **Extract CSS** from any HTML file → `src/css/styles.css`
5. **Extract JS** from any HTML file → `src/js/scripts.js`
6. **Create pages** in `src/` (one .njk file per page)
7. **Build:** `npm run build`
8. **Test:** Check `dist/` folders
9. **Deploy:** `npm run deploy`

Detailed migration instructions in `MIGRATION-GUIDE.md`.

---

## 🤝 Contributing

**To add a new TLD:**

1. Add configuration to `build-all-sites.js`:
   ```javascript
   sites.uk = {
     url: 'https://contraco.co.uk',
     lang: 'en',
     // ... etc
   };
   ```

2. Add npm scripts to `package.json`:
   ```json
   "build:uk": "node build-all-sites.js uk",
   "serve:uk": "npm run build:uk && npx @11ty/eleventy --serve"
   ```

3. Create `src/assets-tld/uk/` folder for UK-specific assets

4. Rebuild: `npm run build`

---

## 📚 Resources

- [11ty Documentation](https://www.11ty.dev/docs/)
- [Nunjucks Templates](https://mozilla.github.io/nunjucks/)
- [Node.js Downloads](https://nodejs.org/)

---

## ✅ Checklist

After setup:
- [ ] `npm install` completed
- [ ] All TLD assets copied to `src/assets-tld/`
- [ ] CSS extracted to `src/css/styles.css`
- [ ] JS extracted to `src/js/scripts.js`
- [ ] `npm run build` succeeds
- [ ] All 5 folders in `dist/` created
- [ ] Tested one site locally
- [ ] Ready to deploy!

---

**🎉 You now manage 5 websites from 1 codebase!**

Change anything once → applies everywhere → 96% time savings!
