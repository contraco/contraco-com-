# Migration Guide: From Manual HTML to 11ty

This guide walks you through migrating from the current manual HTML setup to the 11ty static site generator.

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [Phase 1: Quick Wins (External CSS/JS)](#phase-1-quick-wins)
3. [Phase 2: Full 11ty Migration](#phase-2-full-11ty-migration)
4. [Testing](#testing)
5. [Deployment](#deployment)
6. [Troubleshooting](#troubleshooting)

---

## Prerequisites

### Required Software

1. **Node.js 14+** (18 recommended)
   ```bash
   node --version  # Should show v14.0.0 or higher
   ```
   If not installed: Download from https://nodejs.org/

2. **Git** (already installed)

3. **Text editor** (VS Code recommended)

---

## Phase 1: Quick Wins (External CSS/JS)

**Goal:** Extract inline CSS and JavaScript to external files
**Time:** 2-4 hours per TLD
**Complexity:** Low
**Benefit:** 60% file size reduction, easier maintenance

### Step 1.1: Run Extraction Script

```bash
# For contraco-net (example)
cd /path/to/contraco-net

# Copy extraction script from PHASE1-extract-css-js.sh
# Run it:
bash PHASE1-extract-css-js.sh /path/to/contraco-net
```

This creates:
- `styles.css` (extracted CSS)
- `scripts.js` (common JavaScript)
- `update-html-files.sh` (helper script)

### Step 1.2: Update HTML Files

```bash
# Run the updater
bash update-html-files.sh
```

### Step 1.3: Manual Cleanup (IMPORTANT)

For each HTML file (except yandex verification):

1. **Verify CSS link in `<head>`:**
   ```html
   <link rel="stylesheet" href="/styles.css">
   ```

2. **Remove inline `<style>` blocks:**
   - Search for `<style>`
   - Delete entire `<style>...</style>` block
   - Keep only the `<link rel="stylesheet">` tag

3. **Add JS script before `</body>`:**
   ```html
   <script src="/scripts.js"></script>
   </body>
   ```

4. **Remove duplicate inline scripts:**
   - Remove logo fallback script (now in scripts.js)
   - Remove navigation toggle script (now in scripts.js)
   - **KEEP** page-specific GA config in `<head>`

5. **FIX DUPLICATE GA TRACKING (Critical!):**
   - Remove any `gtag('event', 'page_view')` calls
   - Keep only `gtag('config', 'G-868WGCC45D')` in `<head>`

### Step 1.4: Test Locally

```bash
# Open any HTML file in browser
open index.html
# or
firefox index.html
```

**Checklist:**
- [ ] Page loads correctly
- [ ] CSS styles applied
- [ ] Logo displays (or fallback text shows)
- [ ] Navigation works
- [ ] Footer displays correctly
- [ ] Check browser console for errors (F12)

### Step 1.5: Commit and Push

```bash
git add styles.css scripts.js
git add *.html
git commit -m "Extract CSS and JS to external files for maintainability"
git push
```

### Step 1.6: Repeat for Other TLDs

Repeat Steps 1.1-1.5 for:
- contraco-de
- contraco-kr
- contraco-ru
- contraco-com

---

## Phase 2: Full 11ty Migration

**Goal:** Set up 11ty build system with templates
**Time:** 1-2 days for first TLD, 4-6 hours for subsequent TLDs
**Complexity:** Medium
**Benefit:** 90% complexity reduction, professional workflow

### Step 2.1: Set Up 11ty Project (contraco-net as pilot)

```bash
# Create new directory for 11ty source
mkdir contraco-net-11ty
cd contraco-net-11ty

# Copy the PHASE2-11ty-setup files here:
cp -r /path/to/PHASE2-11ty-setup/* .

# Install dependencies
npm install
```

### Step 2.2: Configure for Your TLD

**Edit `src/_data/site.json`:**
```json
{
  "url": "https://contraco.net",
  "lang": "en",
  "gaTrackingId": "G-868WGCC45D",
  "tagline": "Established 1998 • Premium Transformation Consulting",
  "description": "Strategic Clarity • Technological Intelligence • Psychological Depth",
  "privacyLinkText": "Privacy Statement",
  "trademark": "The Resonance Method™ is a trademark of contraco.",
  "showLanguageSelector": true
}
```

**For other TLDs, change:**
- contraco-de: `"url": "https://contraco.de"`, `"lang": "de"`
- contraco-kr: `"url": "https://contraco.co.kr"`, `"lang": "ko"`
- contraco-ru: `"url": "https://contraco.ru"`, `"lang": "ru"`
- contraco-com: `"url": "https://contraco.com"`, `"lang": "en"`

### Step 2.3: Copy Assets

```bash
cd contraco-net-11ty

# Copy CSS (from Phase 1 or extract from current HTML)
cp /path/to/contraco-net/styles.css src/css/

# Copy JavaScript
cp /path/to/contraco-net/scripts.js src/js/

# Copy all favicon and logo files
cp /path/to/contraco-net/*.png src/
cp /path/to/contraco-net/*.ico src/
cp /path/to/contraco-net/*.svg src/
cp /path/to/contraco-net/*.xml src/
cp /path/to/contraco-net/site.webmanifest src/

# Copy verification files
cp /path/to/contraco-net/*.txt src/
cp /path/to/contraco-net/yandex*.html src/

# Copy CNAME and robots.txt
cp /path/to/contraco-net/CNAME src/
cp /path/to/contraco-net/robots.txt src/
```

### Step 2.4: Migrate Content Pages

For each HTML page in your old site, create a new `.njk` file in `src/`.

**Example: Migrating about.html**

Old file (about.html, 1000 lines):
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About contraco</title>
    <style>
        /* 650 lines of CSS */
    </style>
</head>
<body>
    <nav><!-- header --></nav>

    <section class="about-content">
        <h1>About contraco</h1>
        <p>Content here...</p>
    </section>

    <footer><!-- footer --></footer>
    <script>/* 78 lines of JS */</script>
</body>
</html>
```

New file (src/about.njk, 30 lines):
```yaml
---
layout: base.njk
title: About contraco - Premium Transformation Consulting
description: Learn about contraco's 27 years of leadership...
gaPageTitle: About contraco - Premium Transformation Consulting
---

<section class="about-content">
    <div class="container">
        <h1>About contraco</h1>
        <p>Content here...</p>
    </div>
</section>
```

**What to include in front matter (---...---):**
- `layout`: Always `base.njk`
- `title`: Page title (for `<title>` tag and SEO)
- `description`: Meta description for SEO (optional but recommended)
- `gaPageTitle`: Custom Google Analytics page title

**What to include in body:**
- Only the unique content (between `<main>` tags in old file)
- Remove `<nav>`, `<footer>`, `<style>`, `<script>` (templates handle these)

### Step 2.5: Extract Header from Old Site

Open your old site's HTML in an editor and find the `<nav>` section.

**Copy navigation structure to `src/_includes/header.njk`:**

```html
<nav class="navbar">
    <div class="nav-container">
        <a href="{{ site.url }}" class="logo" id="site-logo">
            <img src="{{ site.url }}/Logo_rectangle.svg"
                 alt="contraco"
                 onerror="this.parentElement.classList.add('logo-failed');">
            <span class="logo-fallback">contraco</span>
        </a>
        <ul class="nav-menu">
            {% for item in navigation %}
            <li><a href="{{ item.url }}">{{ item.text }}</a></li>
            {% endfor %}
        </ul>
    </div>
</nav>
```

**Update `src/_data/navigation.json` with your actual nav items:**
```json
[
  { "text": "Home", "url": "/" },
  { "text": "About", "url": "/about.html" },
  { "text": "Services", "url": "/#services" },
  { "text": "Contact", "url": "/contact.html" }
]
```

### Step 2.6: Extract Footer from Old Site

Copy footer structure to `src/_includes/footer.njk`:

```html
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="footer-tagline">{{ site.tagline }}</div>
            <div class="footer-description">{{ site.description }}</div>
        </div>
        <div class="footer-bottom">
            <div class="footer-privacy-links">
                <a href="/privacy-statement.html">{{ site.privacyLinkText }}</a>
            </div>
            <p>&copy; {% year %} contraco. All rights reserved.</p>
            <p class="trademark-notice">{{ site.trademark }}</p>
        </div>
    </div>
</footer>
```

### Step 2.7: Build and Test

```bash
# Start development server
npm start

# Opens at http://localhost:8080
# Browse your pages
# Check all links work
# Verify styles load correctly
# Test responsive design
```

**Verification Checklist:**
- [ ] Homepage loads correctly
- [ ] All navigation links work
- [ ] Footer displays on all pages
- [ ] CSS styles applied correctly
- [ ] JavaScript functions work (logo fallback, etc.)
- [ ] Favicon displays
- [ ] Privacy statement page exists and loads
- [ ] All content pages accessible
- [ ] No console errors (F12 → Console tab)

### Step 2.8: Build for Production

```bash
npm run build
```

This creates the `_site/` directory with your final HTML files.

**Verify output:**
```bash
ls -la _site/

# Should see:
# - index.html
# - about.html
# - contact.html
# - css/styles.css
# - js/scripts.js
# - All favicon files
# - All verification files
```

---

## Testing

### Local Testing

1. **Test in multiple browsers:**
   ```bash
   # After building
   cd _site
   python3 -m http.server 8000
   # Open http://localhost:8000
   ```

2. **Check each page:**
   - [ ] Content displays correctly
   - [ ] Navigation works
   - [ ] Footer displays
   - [ ] Links work (no 404s)
   - [ ] Images load
   - [ ] Responsive design (resize browser)

3. **Check browser console (F12):**
   - [ ] No JavaScript errors
   - [ ] No missing resources (CSS, images)
   - [ ] Google Analytics fires (check Network tab)

### Pre-Deployment Checklist

- [ ] All pages build successfully
- [ ] No build errors or warnings
- [ ] All assets copy to `_site/`
- [ ] CNAME file present in `_site/`
- [ ] robots.txt present in `_site/`
- [ ] sitemap.xml present in `_site/` (note: may need separate workflow)
- [ ] All favicon files present
- [ ] Yandex verification file present

---

## Deployment

### Option 1: Manual Deployment (First Time)

```bash
# Build
npm run build

# Go to old contraco-net repo
cd /path/to/contraco-net

# Create backup branch
git checkout -b backup-old-site
git push origin backup-old-site

# Switch to main
git checkout main

# Copy built files
rm -rf *.html *.css *.js  # Remove old files
cp -r /path/to/contraco-net-11ty/_site/* .

# Commit
git add .
git commit -m "Migrate to 11ty build system"
git push
```

### Option 2: Automated Deployment (Recommended)

1. **Push 11ty source to new branch:**
   ```bash
   cd /path/to/contraco-net-11ty

   git init
   git remote add origin https://github.com/contraco/contraco-net.git
   git checkout -b 11ty-source
   git add .
   git commit -m "Add 11ty source files"
   git push -u origin 11ty-source
   ```

2. **Set up GitHub Actions:**
   - Copy `.github/workflows/build-and-deploy.yml` to your repo
   - Commit and push to `11ty-source` branch
   - Go to GitHub → Settings → Pages
   - Source: Deploy from branch
   - Branch: `gh-pages` (will be created by workflow)

3. **On every push to `11ty-source`:**
   - GitHub Actions builds site
   - Deploys to `gh-pages` branch
   - GitHub Pages serves from `gh-pages`

---

## Troubleshooting

### Build Errors

**Error: `Cannot find module '@11ty/eleventy'`**
```bash
npm install
```

**Error: `ENOENT: no such file or directory, open 'src/index.njk'`**
- Check you're in the right directory
- Verify `src/` folder exists
- Check file names are correct

**Error: Template not found**
- Check `layout: base.njk` in front matter
- Verify `src/_includes/base.njk` exists

### Styling Issues

**Styles not applying:**
- Check `src/css/styles.css` exists
- Verify `.eleventy.js` has `addPassthroughCopy("src/css")`
- Check browser console for 404 on styles.css
- Hard refresh browser (Ctrl+Shift+R)

**Styles work locally but not after deployment:**
- Check CNAME is in `_site/`
- Verify CSS file copied to `_site/css/`
- Check GitHub Pages settings (correct branch)

### JavaScript Issues

**Scripts not loading:**
- Check `src/js/scripts.js` exists
- Verify `.eleventy.js` has `addPassthroughCopy("src/js")`
- Check browser console for errors

**Logo fallback not working:**
- Verify `#site-logo` id on logo link
- Check scripts.js has logo fallback code
- Test image URL (try loading image directly)

### Navigation Issues

**Navigation items not showing:**
- Check `src/_data/navigation.json` exists and has valid JSON
- Verify header.njk has `{% for item in navigation %}`
- Check browser console for errors

**Links go to 404:**
- Verify file exists in `src/`
- Check URL matches exactly (case-sensitive)
- Build and check `_site/` has the file

### Google Analytics Issues

**GA not tracking:**
- Check `src/_data/site.json` has correct `gaTrackingId`
- Verify base.njk includes GA script
- Open browser console → Network tab
- Look for requests to `googletagmanager.com`
- Check Real-Time report in GA4

**Duplicate pageviews (from old bug):**
- Search all `.njk` files for `gtag('event', 'page_view')`
- Remove any manual pageview events
- Only `gtag('config')` in base.njk should exist

---

## Success Metrics

After migration, you should see:

**File size reduction:**
- Old: Each HTML file 50-80KB
- New: Each source file 20-50 lines, built HTML 15-30KB

**Maintenance time:**
- Old: Change footer = edit 85 files (17 × 5 TLDs)
- New: Change footer = edit 1 file, rebuild

**Build time:**
- Typical: 2-5 seconds for full build
- Acceptable: Up to 10 seconds

**Developer experience:**
- Add new page: 5 minutes (was: 30 minutes)
- Change navigation: 1 minute (was: 2-3 hours)
- Fix CSS bug: 1 minute (was: 2-3 hours)

---

## Next Steps After Successful Migration

1. **Migrate remaining TLDs:**
   - Follow same process for contraco-de, contraco-kr, contraco-ru, contraco-com
   - Should be faster (4-6 hours each) now that you know the process

2. **Set up automated sitemap generation:**
   - Add 11ty plugin for sitemap
   - Or keep existing workflow

3. **Consider adding:**
   - Image optimization
   - Minification (CSS/JS)
   - Analytics dashboard

4. **Document customizations:**
   - Update README with any TLD-specific changes
   - Document any custom shortcodes or filters

---

## Getting Help

**11ty Documentation:**
- https://www.11ty.dev/docs/

**Common issues:**
- Search GitHub issues: https://github.com/11ty/eleventy/issues

**Need help?**
- 11ty Discord: https://www.11ty.dev/blog/discord/
- Stack Overflow: Tag `eleventy`

---

## Rollback Plan

If something goes wrong:

```bash
# Old site backed up in branch
git checkout backup-old-site

# Deploy old site
git checkout main
git reset --hard backup-old-site
git push -f origin main
```

Make sure you create `backup-old-site` branch BEFORE making changes!
