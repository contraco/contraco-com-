# contraco Website - 11ty Static Site Generator

This is the modernized version of the contraco website using [11ty (Eleventy)](https://www.11ty.dev/) static site generator.

## Benefits

✅ **90% complexity reduction** - Edit header/footer/CSS once, applies everywhere
✅ **Faster development** - Add new pages in 5 minutes
✅ **Better maintainability** - One source of truth for all templates
✅ **Automated builds** - GitHub Actions builds and deploys automatically
✅ **Same output** - Generates clean static HTML for GitHub Pages

## Project Structure

```
.
├── .eleventy.js              # 11ty configuration
├── package.json              # Dependencies
├── src/                      # Source files (EDIT THESE)
│   ├── _data/                # Global data
│   │   ├── site.json         # Site-wide settings (tracking ID, URLs, etc.)
│   │   └── navigation.json   # Navigation menu items
│   ├── _includes/            # Templates and partials
│   │   ├── base.njk          # Base layout (header/footer wrapper)
│   │   ├── header.njk        # Site header (edit once, applies everywhere)
│   │   └── footer.njk        # Site footer (edit once, applies everywhere)
│   ├── css/                  # Stylesheets
│   │   └── styles.css        # Main stylesheet
│   ├── js/                   # JavaScript files
│   │   └── scripts.js        # Main scripts
│   ├── assets/               # Images, logos, etc.
│   ├── index.njk             # Homepage
│   ├── about.njk             # About page
│   ├── contact.njk           # Contact page
│   └── ... (other pages)
└── _site/                    # Build output (DEPLOY THIS)
```

## Quick Start

### 1. Install Dependencies

```bash
npm install
```

### 2. Development Server

```bash
npm start
# or
npm run serve
```

Opens at `http://localhost:8080` with live reload.

### 3. Build for Production

```bash
npm run build
```

Outputs to `_site/` directory.

### 4. Deploy

The `_site/` directory is deployed automatically via GitHub Actions on push to main branch.

## Creating a New Page

1. Create `src/my-new-page.njk`:

```yaml
---
layout: base.njk
title: My New Page Title
description: Page description for SEO
gaPageTitle: Custom GA Page Title
---

<section class="page-header">
    <div class="container">
        <h1>My New Page</h1>
    </div>
</section>

<section class="content">
    <div class="container">
        <p>Your content here...</p>
    </div>
</section>
```

2. Add to navigation in `src/_data/navigation.json` (if needed)
3. Run `npm run build`
4. Done! Header, footer, CSS, JS, favicon, GA all included automatically.

## Editing Site-Wide Settings

**Edit once, applies everywhere:**

- **Site URL, GA tracking ID, tagline:** `src/_data/site.json`
- **Navigation menu:** `src/_data/navigation.json`
- **Header:** `src/_includes/header.njk`
- **Footer:** `src/_includes/footer.njk`
- **CSS:** `src/css/styles.css`
- **JavaScript:** `src/js/scripts.js`

## Migration from Old Site

See `MIGRATION-GUIDE.md` for detailed step-by-step instructions.

## Common Tasks

### Change footer text
Edit `src/_includes/footer.njk` → Build → Done (applies to all 17 pages)

### Update navigation menu
Edit `src/_data/navigation.json` → Build → Done (applies to all pages)

### Fix CSS bug
Edit `src/css/styles.css` → Build → Done (applies to all pages)

### Update Google Analytics tracking
Edit `src/_data/site.json` change `gaTrackingId` → Build → Done (applies to all pages)

## Troubleshooting

**Build fails:**
- Check Node.js version: `node --version` (need 14+)
- Delete `node_modules/` and `package-lock.json`, run `npm install` again

**Pages not updating:**
- Run `npm run clean` then `npm run build`
- Check browser cache (hard refresh: Ctrl+Shift+R)

**Styles not loading:**
- Verify `src/css/styles.css` exists
- Check `.eleventy.js` has `addPassthroughCopy("src/css")`

## Resources

- [11ty Documentation](https://www.11ty.dev/docs/)
- [Nunjucks Template Syntax](https://mozilla.github.io/nunjucks/templating.html)
- [GitHub Actions for 11ty](https://www.11ty.dev/docs/deployment/)
