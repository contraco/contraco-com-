# CONTRACO HTML BRIEFING DOCUMENT
## Complete Reference for Creating & Modifying HTML Pages Across All TLD Sites

**Version:** 1.0
**Last Updated:** November 13, 2025
**Purpose:** Complete technical reference for claude.ai/code to create new HTML documents in contraco style

---

## TABLE OF CONTENTS

1. [Executive Summary](#1-executive-summary)
2. [Repository Structure](#2-repository-structure)
3. [Complete File Inventory](#3-complete-file-inventory)
4. [Standard HTML Head Template](#4-standard-html-head-template)
5. [Standard Header/Navigation](#5-standard-headernavigation)
6. [Standard Footer](#6-standard-footer)
7. [CSS Design System](#7-css-design-system)
8. [JavaScript Functionality](#8-javascript-functionality)
9. [SEO Implementation](#9-seo-implementation)
10. [Google Analytics](#10-google-analytics)
11. [Favicon & Icon Files](#11-favicon--icon-files)
12. [SVG Graphics](#12-svg-graphics)
13. [PNG Logos](#13-png-logos)
14. [Privacy & Legal Pages](#14-privacy--legal-pages)
15. [Contact Forms](#15-contact-forms)
16. [Regional Variations](#16-regional-variations)
17. [Creating New Pages Checklist](#17-creating-new-pages-checklist)
18. [Reusable Code Snippets](#18-reusable-code-snippets)
19. [Brand Guidelines](#19-brand-guidelines)
20. [Quick Reference](#20-quick-reference)

---

## 1. EXECUTIVE SUMMARY

### The Contraco Web Ecosystem

Contraco operates **5 distinct websites**:

| Site | URL | Purpose | Language |
|------|-----|---------|----------|
| **Hub** | contraco.com | Market selector/distribution hub | English |
| **Global/US** | contraco.net | Primary US/English site | English |
| **Germany** | contraco.de | German market site | German |
| **Russia** | contraco.ru | Russian market site | Russian |
| **Korea** | contraco.co.kr | Korean market site | Korean |

### Key Architecture Principles

1. **Highly Standardized:** All TLD sites share identical structure, design, and implementation
2. **Flat File Structure:** No subdirectories; all files in root
3. **Inline CSS:** Styles embedded in each HTML file (no external stylesheets)
4. **Static HTML:** No build process or server-side rendering
5. **Multi-Regional SEO:** Complete hreflang implementation across all sites
6. **Consistent Branding:** Same design system, colors, and typography

### What's Consistent vs. What Varies

**100% Consistent:**
- Design system (colors, typography, layout)
- File structure and naming
- Navigation and footer HTML structure
- All JavaScript functionality
- Icon/favicon set (25+ files)
- SVG graphics (6 files)
- Google Analytics configuration
- Contact form setup (FormSubmit.co)

**Regional Variations:**
- Content language and translations
- HTML `lang` attribute
- URLs (different TLDs)
- Verification files (Yandex, search engines)
- Korean site adds Noto Sans KR font

---

## 2. REPOSITORY STRUCTURE

### GitHub Organization

**Organization:** https://github.com/contraco

**Repositories:**
- `contraco-com` - Hub site (contraco.com)
- `contraco-net` - US/Global site (contraco.net)
- `contraco-de` - German site (contraco.de)
- `contraco-ru` - Russian site (contraco.ru)
- `contraco-kr` - Korean site (contraco.co.kr)

### Local File Structure

All repositories follow this **flat structure** (no subdirectories):

```
contraco-[tld]/
├── index.html                          # Homepage
├── about.html                          # About page
├── contact.html                        # Contact page
├── insights.html                       # Insights hub
├── thank-you.html                      # Form thank you page
├── copyright.html                      # Copyright information
├── privacy-statement.html              # Privacy policy
├── resonance-method.html               # Methodology page
├── strategic-intelligence.html         # Service page
├── ai-adoption-research.html           # Insight article
├── ai-strategy-framework.html          # Insight article
├── cfo-digital-transformation-roi.html # Insight article
├── cultural-adaptation-guide.html      # Insight article
├── digital-transformation-roi.html     # Insight article
├── leading-ai-transformation.html      # Insight article
├── organizational-design-ai.html       # Insight article
├── pricing-psychology.html             # Insight article
├── vendor-selection-mastery.html       # Insight article
│
├── Logo_rectangle.svg                  # Primary logo (2.4KB)
├── Logo_rectangle.png                  # Logo fallback (33KB)
├── contraco_logo.png                   # Alternative logo (71KB)
│
├── arrow-right.svg                     # Icon
├── checkmark.svg                       # Icon
├── psychological-depth.svg             # Brand graphic
├── strategic-clarity.svg               # Brand graphic
├── technological-intelligence.svg      # Brand graphic
├── warning.svg                         # Icon
│
├── favicon.ico                         # Standard favicon
├── favicon-16x16.png                   # 16px favicon
├── favicon-32x32.png                   # 32px favicon
├── favicon-96x96.png                   # 96px favicon
│
├── apple-touch-icon.png                # Default Apple icon
├── apple-touch-icon-precomposed.png    # Apple precomposed
├── apple-touch-icon-57x57.png          # 57px Apple icon
├── apple-touch-icon-60x60.png          # 60px Apple icon
├── apple-touch-icon-72x72.png          # 72px Apple icon
├── apple-touch-icon-76x76.png          # 76px Apple icon
├── apple-touch-icon-114x114.png        # 114px Apple icon
├── apple-touch-icon-120x120.png        # 120px Apple icon
├── apple-touch-icon-144x144.png        # 144px Apple icon
├── apple-touch-icon-152x152.png        # 152px Apple icon
├── apple-touch-icon-180x180.png        # 180px Apple icon
│
├── android-icon-36x36.png              # 36px Android icon
├── android-icon-48x48.png              # 48px Android icon
├── android-icon-72x72.png              # 72px Android icon
├── android-icon-96x96.png              # 96px Android icon
├── android-icon-144x144.png            # 144px Android icon
├── android-icon-192x192.png            # 192px Android icon
│
├── ms-icon-70x70.png                   # 70px Microsoft tile
├── ms-icon-144x144.png                 # 144px Microsoft tile
├── ms-icon-150x150.png                 # 150px Microsoft tile
├── ms-icon-310x310.png                 # 310px Microsoft tile
│
├── robots.txt                          # Search engine directives
├── sitemap.xml                         # XML sitemap
├── site.webmanifest                    # PWA manifest
├── browserconfig.xml                   # Windows tile config
│
├── yandex_[hash].html                  # Yandex verification (unique per TLD)
├── [hash].txt                          # Search verification (unique per TLD)
├── CNAME                               # GitHub Pages domain config
└── README.md                           # Repository documentation
```

**Total Files per Repository:** ~50-55 files
**Total HTML Pages:** 18 per site
**Total Icon Files:** 25 per site
**Total SVG Graphics:** 6 per site

---

## 3. COMPLETE FILE INVENTORY

### HTML Pages (18 files)

| Filename | Purpose | Priority |
|----------|---------|----------|
| index.html | Homepage | Critical |
| about.html | About page | High |
| contact.html | Contact page | High |
| insights.html | Insights hub | High |
| privacy-statement.html | Privacy policy | Required |
| resonance-method.html | Methodology | Medium |
| strategic-intelligence.html | Service page | Medium |
| thank-you.html | Form success page | Required |
| copyright.html | Copyright info | Low |
| ai-adoption-research.html | Article | Content |
| ai-strategy-framework.html | Article | Content |
| cfo-digital-transformation-roi.html | Article | Content |
| cultural-adaptation-guide.html | Article | Content |
| digital-transformation-roi.html | Article | Content |
| leading-ai-transformation.html | Article | Content |
| organizational-design-ai.html | Article | Content |
| pricing-psychology.html | Article | Content |
| vendor-selection-mastery.html | Article | Content |

### Icon/Favicon Files (25 files)

**Standard Favicons (4 files):**
- `favicon.ico` (3,045 bytes)
- `favicon-16x16.png` (480 bytes)
- `favicon-32x32.png` (1,024 bytes)
- `favicon-96x96.png` (3,104 bytes)

**Apple Touch Icons (11 files):**
- `apple-touch-icon.png` (6,283 bytes) - Default
- `apple-touch-icon-precomposed.png` (6,283 bytes)
- `apple-touch-icon-57x57.png` (1,828 bytes)
- `apple-touch-icon-60x60.png` (1,867 bytes)
- `apple-touch-icon-72x72.png` (2,246 bytes)
- `apple-touch-icon-76x76.png` (2,380 bytes)
- `apple-touch-icon-114x114.png` (3,791 bytes)
- `apple-touch-icon-120x120.png` (4,047 bytes)
- `apple-touch-icon-144x144.png` (5,024 bytes)
- `apple-touch-icon-152x152.png` (5,390 bytes)
- `apple-touch-icon-180x180.png` (6,283 bytes)

**Android Icons (6 files):**
- `android-icon-36x36.png` (1,157 bytes)
- `android-icon-48x48.png` (1,487 bytes)
- `android-icon-72x72.png` (2,246 bytes)
- `android-icon-96x96.png` (3,104 bytes)
- `android-icon-144x144.png` (5,024 bytes)
- `android-icon-192x192.png` (6,740 bytes)

**Microsoft Tile Icons (4 files):**
- `ms-icon-70x70.png` (2,213 bytes)
- `ms-icon-144x144.png` (5,024 bytes)
- `ms-icon-150x150.png` (5,173 bytes)
- `ms-icon-310x310.png` (8,470 bytes)

### SVG Graphics (6 files)

| Filename | Size | Purpose |
|----------|------|---------|
| Logo_rectangle.svg | 2.4 KB | Primary brand logo |
| arrow-right.svg | 564 bytes | Navigation arrow |
| checkmark.svg | 393 bytes | Feature checkmark (red #C00000) |
| warning.svg | 771 bytes | Warning/alert icon |
| strategic-clarity.svg | 1.8 KB | Brand pillar graphic |
| technological-intelligence.svg | 6.6 KB | Brand pillar graphic |
| psychological-depth.svg | 12 KB | Brand pillar graphic |

### PNG Logos (2-3 files)

| Filename | Size | Purpose |
|----------|------|---------|
| Logo_rectangle.png | 33 KB | Logo fallback (raster) |
| contraco_logo.png | 71 KB | Alternative logo variant |

### Configuration Files (4 files)

| Filename | Purpose |
|----------|---------|
| robots.txt | Search engine crawling directives |
| sitemap.xml | XML sitemap (all pages) |
| site.webmanifest | PWA manifest configuration |
| browserconfig.xml | Windows tile configuration |

---

## 4. STANDARD HTML HEAD TEMPLATE

This is the **complete, reusable `<head>` section** for all new HTML pages.

### Complete Template

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>[Page Title] | contraco</title>

    <!-- Canonical Tag -->
    <link rel="canonical" href="https://contraco.[tld]/[page].html">

    <!-- Robots Meta Tag -->
    <meta name="robots" content="index, follow">

    <!-- Complete hreflang for International SEO -->
    <link rel="alternate" href="https://contraco.net/[page].html" hreflang="x-default" />
    <link rel="alternate" hreflang="en" href="https://contraco.net/[page].html" />
    <link rel="alternate" hreflang="de" href="https://contraco.de/[page].html" />
    <link rel="alternate" hreflang="ru" href="https://contraco.ru/[page].html" />
    <link rel="alternate" hreflang="ko" href="https://contraco.co.kr/[page].html" />

    <!-- Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-868WGCC45D"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-868WGCC45D', {
            page_title: '[Page Title] - contraco',
            page_location: window.location.href
        });
    </script>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- COMPLETE Favicon Set -->
    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
    <link rel="apple-touch-icon" href="/apple-touch-icon.png">
    <link rel="manifest" href="/site.webmanifest">
    <meta name="msapplication-TileColor" content="#C00000">
    <meta name="msapplication-TileImage" content="/mstile-144x144.png">
    <meta name="theme-color" content="#C00000">

    <!-- SEO Meta Tags -->
    <meta name="description" content="[Page description - 150-160 characters]">
    <meta name="keywords" content="[relevant, keywords, comma-separated]">
    <meta name="author" content="contraco">

    <!-- Open Graph / Social Media -->
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://contraco.[tld]/[page].html">
    <meta property="og:title" content="[Page Title] | contraco">
    <meta property="og:description" content="[Page description]">

    <!-- Structured Data -->
    <script type="application/ld+json">
    {
        "@context": "https://schema.org",
        "@type": "WebPage",
        "name": "[Page Title]",
        "description": "[Page Description]",
        "url": "https://contraco.[tld]/[page].html",
        "publisher": {
            "@type": "Organization",
            "name": "contraco",
            "url": "https://contraco.[tld]/",
            "logo": "https://contraco.[tld]/Logo_rectangle.svg"
        }
    }
    </script>

    <style>
        /* [INLINE CSS - See Section 7 for complete CSS template] */
    </style>
</head>
```

### Template Variables to Replace

| Placeholder | Replace With | Example |
|-------------|--------------|---------|
| `[tld]` | net, de, ru, or co.kr | `net` |
| `[page]` | HTML filename without .html | `about` |
| `[Page Title]` | Human-readable page title | `About Us` |
| `[Page description]` | SEO meta description (150-160 chars) | `Learn about contraco's 27 years...` |
| `[relevant, keywords]` | Comma-separated keywords | `consulting, transformation, AI` |

### Critical Notes

1. **hreflang is MANDATORY:** Every page must include all 5 hreflang tags (x-default + 4 languages)
2. **Canonical URL:** Must match the current page's URL exactly
3. **Google Analytics ID:** Same for ALL sites: `G-868WGCC45D`
4. **Favicon links:** All 14 favicon link tags required (don't omit any)
5. **Theme color:** Always `#C00000` (primary red)

---

## 5. STANDARD HEADER/NAVIGATION

### Complete Navigation HTML

```html
<nav class="navbar">
    <div class="nav-container">
        <a href="https://contraco.[tld]/" class="logo" id="site-logo">
            <img src="https://contraco.[tld]/Logo_rectangle.svg"
                 alt="contraco"
                 onerror="this.parentElement.classList.add('logo-failed');">
            <span class="logo-fallback">contraco</span>
        </a>
        <div style="display: flex; align-items: center;">
            <ul class="nav-menu">
                <li><a href="https://contraco.[tld]/#services" class="nav-link">Services</a></li>
                <li><a href="https://contraco.[tld]/#methodology" class="nav-link">Methodology</a></li>
                <li><a href="https://contraco.[tld]/insights.html" class="nav-link">Insights</a></li>
                <li><a href="https://contraco.[tld]/about.html" class="nav-link">About</a></li>
                <li><a href="https://contraco.[tld]/#contact" class="nav-link">Contact</a></li>
            </ul>
            <div class="language-switcher">
                <a href="https://contraco.net/[page].html" class="lang-link" data-lang="en">EN</a>
                <a href="https://contraco.de/[page].html" class="lang-link" data-lang="de">DE</a>
                <a href="https://contraco.ru/[page].html" class="lang-link" data-lang="ru">RU</a>
                <a href="https://contraco.co.kr/[page].html" class="lang-link" data-lang="ko">KO</a>
            </div>
        </div>
    </div>
</nav>
```

### Navigation CSS (Include in `<style>`)

```css
/* Navigation */
.navbar {
    position: fixed;
    top: 0;
    width: 100%;
    background: rgba(248, 246, 243, 0.95);
    backdrop-filter: blur(10px);
    z-index: 1000;
    padding: 12px 0;
    transition: all 0.3s ease;
    box-shadow: 0 2px 20px rgba(0, 0, 0, 0.05);
}

.nav-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 40px;
}

.logo {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    text-decoration: none;
}

.logo img {
    height: 58px;
    width: auto;
    transition: opacity 0.3s ease;
}

.logo-fallback {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--primary-red);
    letter-spacing: -0.02em;
    font-family: var(--font-serif);
    display: none;
}

.logo.logo-failed img {
    display: none;
}

.logo.logo-failed .logo-fallback {
    display: block;
}

.nav-menu {
    display: flex;
    list-style: none;
    gap: 35px;
    margin-right: 30px;
}

.nav-link {
    text-decoration: none;
    color: var(--deep-charcoal);
    font-weight: 500;
    font-size: 0.95rem;
    transition: color 0.3s ease;
    position: relative;
}

.nav-link:hover {
    color: var(--primary-red);
}

.nav-link::after {
    content: '';
    position: absolute;
    bottom: -5px;
    left: 0;
    width: 0;
    height: 2px;
    background: var(--primary-red);
    transition: width 0.3s ease;
}

.nav-link:hover::after {
    width: 100%;
}

.language-switcher {
    display: flex;
    gap: 12px;
    padding-left: 30px;
    border-left: 1px solid var(--warm-gray-light);
}

.lang-link {
    text-decoration: none;
    color: var(--warm-gray-medium);
    font-weight: 500;
    font-size: 0.85rem;
    transition: all 0.3s ease;
    padding: 4px 8px;
    border-radius: 4px;
}

.lang-link:hover {
    color: var(--primary-red);
    background: rgba(192, 0, 0, 0.05);
}

.lang-link.active {
    color: var(--primary-red);
    font-weight: 600;
    background: rgba(192, 0, 0, 0.1);
}

/* Responsive Navigation */
@media (max-width: 768px) {
    .nav-menu {
        display: none; /* Mobile menu requires additional implementation */
    }

    .language-switcher {
        padding-left: 0;
        border-left: none;
    }
}
```

### Navigation JavaScript (Include before `</body>`)

```javascript
// Set active language in language switcher
(function() {
    const currentLang = document.documentElement.lang;
    document.querySelectorAll('.lang-link').forEach(link => {
        if (link.getAttribute('data-lang') === currentLang) {
            link.classList.add('active');
        }
    });
})();
```

### Key Features

1. **Fixed Position:** Navbar stays at top during scroll
2. **Logo Fallback:** If SVG fails to load, shows text "contraco"
3. **Language Switcher:** Links to equivalent page on other TLDs
4. **Active State:** Current language highlighted in switcher
5. **Hover Effects:** Smooth underline animation on navigation links
6. **Backdrop Blur:** Modern glassmorphism effect

---

## 6. STANDARD FOOTER

### Complete Footer HTML

```html
<footer class="footer">
    <div class="container">
        <div class="footer-content">
            <div class="company-info">
                <div class="footer-links">
                    <a href="https://contraco.[tld]/">Home</a>
                    <a href="https://contraco.[tld]/about.html">About Us</a>
                    <a href="https://contraco.[tld]/#services">Services</a>
                    <a href="https://contraco.[tld]/#methodology">Methodology</a>
                    <a href="https://contraco.[tld]/insights.html">Insights</a>
                    <a href="https://contraco.[tld]/#contact">Contact</a>
                </div>
                <h4>contraco USA</h4>
                <p>Premium transformation consulting combining strategic clarity, technological intelligence, and psychological depth.</p>
                <p><strong>General:</strong> transformation@contraco.net</p>
                <p><strong>Data Protection:</strong> dpo@contraco.com</p>
                <p><strong>Phone:</strong> +1 (312) 940-0326</p>
            </div>
            <div class="imprint-section">
                <h4>Company Information</h4>
                <div class="imprint-details">
                    <p><strong>contraco</strong></p>
                    <p>1209 10th Ln.</p>
                    <p>Ava, MO 65608</p>
                    <p>United States</p>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="footer-privacy-links">
                <a href="/privacy-statement.html">Privacy Statement</a>
            </div>
            <p>&copy; 2025 contraco. All rights reserved.</p>
            <p class="trademark-notice">The Resonance Method™ is a trademark of contraco.</p>
        </div>
    </div>
</footer>
```

### Footer CSS (Include in `<style>`)

```css
/* Footer */
.footer {
    background: var(--deep-charcoal);
    color: var(--warm-gray-light);
    padding: 50px 0 35px;
    margin-top: 100px;
}

.footer-content {
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 50px;
    margin-bottom: 32px;
}

.company-info h4,
.imprint-section h4 {
    color: var(--primary-red);
    font-size: 1.1rem;
    margin-bottom: 16px;
    font-family: var(--font-serif);
}

.company-info p,
.imprint-details p {
    margin-bottom: 8px;
    line-height: 1.6;
    font-size: 0.95rem;
    color: var(--warm-gray-light);
}

.footer-links {
    display: flex;
    gap: 25px;
    flex-wrap: wrap;
    margin-bottom: 24px;
}

.footer-links a {
    color: var(--warm-gray-light);
    text-decoration: none;
    transition: color 0.3s ease;
    font-size: 0.95rem;
}

.footer-links a:hover {
    color: var(--primary-red);
}

.footer-bottom {
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    padding-top: 25px;
    text-align: center;
    font-size: 0.85rem;
}

.footer-bottom p {
    margin: 8px 0;
    color: var(--warm-gray-light);
}

.footer-privacy-links {
    margin-bottom: 16px;
}

.footer-privacy-links a {
    color: var(--warm-gray-medium);
    text-decoration: none;
    font-size: 0.85rem;
    transition: color 0.3s ease;
}

.footer-privacy-links a:hover {
    color: var(--primary-red);
}

.trademark-notice {
    font-size: 0.8rem;
    opacity: 0.8;
}

/* Responsive Footer */
@media (max-width: 768px) {
    .footer-content {
        grid-template-columns: 1fr;
        gap: 30px;
        text-align: center;
    }

    .footer-links {
        justify-content: center;
    }
}
```

### Footer Content Requirements

**MUST Include:**
- Company name and tagline
- Contact email: transformation@contraco.net
- Data protection email: dpo@contraco.com
- Phone: +1 (312) 940-0326
- Physical address in Ava, MO
- Privacy statement link
- Copyright notice
- Trademark notice for "The Resonance Method™"

---

## 7. CSS DESIGN SYSTEM

### Complete CSS Variables

```css
:root {
    /* Brand Colors */
    --primary-red: #C00000;
    --deep-charcoal: #404040;
    --warm-white: #F8F6F3;
    --warm-gray-light: #E5E2DD;
    --warm-gray-medium: #A8A5A0;
    --warm-gray-dark: #6B6B6B;

    /* Typography */
    --font-serif: 'Crimson Text', Georgia, 'Times New Roman', serif;
    --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;

    /* Layout */
    --container-max: 1200px;
    --section-padding: 100px 0;

    /* Transitions */
    --transition-fast: 0.3s ease;
    --transition-medium: 0.5s ease;

    /* Shadows */
    --shadow-small: 0 4px 15px rgba(0, 0, 0, 0.05);
    --shadow-medium: 0 8px 30px rgba(0, 0, 0, 0.08);
    --shadow-large: 0 15px 50px rgba(0, 0, 0, 0.1);
    --shadow-hover: 0 20px 60px rgba(0, 0, 0, 0.15);
}
```

### Base Reset & Typography

```css
/* Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: var(--font-sans);
    line-height: 1.6;
    color: var(--deep-charcoal);
    background-color: var(--warm-white);
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

/* Typography Hierarchy */
h1 {
    font-size: 4.2rem;
    font-weight: 700;
    font-family: var(--font-serif);
    color: var(--deep-charcoal);
    line-height: 1.1;
    margin-bottom: 24px;
}

h2 {
    font-size: 2.8rem;
    font-weight: 700;
    font-family: var(--font-serif);
    color: var(--deep-charcoal);
    line-height: 1.2;
    margin-bottom: 20px;
}

h3 {
    font-size: 1.6rem;
    font-weight: 600;
    font-family: var(--font-sans);
    color: var(--deep-charcoal);
    line-height: 1.3;
    margin-bottom: 16px;
}

p {
    font-size: 1rem;
    line-height: 1.6;
    color: var(--warm-gray-dark);
    margin-bottom: 16px;
}

/* Responsive Typography */
@media (max-width: 768px) {
    h1 { font-size: 2.5rem; }
    h2 { font-size: 2rem; }
    h3 { font-size: 1.3rem; }
}
```

### Layout Components

```css
/* Container */
.container {
    max-width: var(--container-max);
    margin: 0 auto;
    padding: 0 40px;
}

@media (max-width: 768px) {
    .container {
        padding: 0 20px;
    }
}

/* Section */
section {
    padding: var(--section-padding);
}

.section-title {
    font-size: 2.8rem;
    font-weight: 700;
    font-family: var(--font-serif);
    color: var(--deep-charcoal);
    text-align: center;
    margin-bottom: 20px;
}

.section-intro {
    font-size: 1.2rem;
    color: var(--warm-gray-dark);
    text-align: center;
    max-width: 800px;
    margin: 0 auto 60px;
    line-height: 1.7;
}
```

### Button Styles

```css
/* CTA Button */
.cta-button {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 16px 32px;
    background: var(--primary-red);
    color: white;
    text-decoration: none;
    font-weight: 600;
    font-size: 1rem;
    border-radius: 6px;
    transition: all var(--transition-fast);
    box-shadow: var(--shadow-medium);
}

.cta-button:hover {
    background: #A00000;
    box-shadow: var(--shadow-hover);
    transform: translateY(-2px);
}

.cta-button svg {
    transition: transform var(--transition-fast);
}

.cta-button:hover svg {
    transform: translateX(4px);
}

/* Secondary Button */
.secondary-button {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    padding: 14px 28px;
    background: white;
    color: var(--primary-red);
    text-decoration: none;
    font-weight: 600;
    font-size: 0.95rem;
    border: 2px solid var(--primary-red);
    border-radius: 6px;
    transition: all var(--transition-fast);
}

.secondary-button:hover {
    background: var(--primary-red);
    color: white;
}
```

### Card Components

```css
/* Service Card */
.service-card {
    background: white;
    padding: 40px 30px;
    border-radius: 12px;
    box-shadow: var(--shadow-medium);
    transition: all var(--transition-fast);
    border: 2px solid transparent;
}

.service-card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow-hover);
    border-color: var(--primary-red);
}

.service-card h3 {
    font-size: 1.4rem;
    margin-bottom: 16px;
    color: var(--deep-charcoal);
}

.service-card p {
    color: var(--warm-gray-dark);
    margin-bottom: 20px;
}

/* Card Grid */
.cards-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 30px;
    margin-top: 60px;
}

@media (max-width: 768px) {
    .cards-grid {
        grid-template-columns: 1fr;
        gap: 20px;
    }
}
```

### Feature Lists

```css
.service-features,
.feature-list {
    list-style: none;
    padding: 0;
    margin: 20px 0;
}

.service-features li,
.feature-list li {
    position: relative;
    padding-left: 30px;
    margin-bottom: 12px;
    color: var(--warm-gray-dark);
    line-height: 1.6;
}

.service-features li::before,
.feature-list li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
    font-size: 1.2rem;
}
```

### Form Styles

```css
/* Contact Form */
.contact-form {
    max-width: 600px;
    margin: 0 auto;
}

.form-group {
    margin-bottom: 20px;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 14px 18px;
    border: 2px solid var(--warm-gray-light);
    border-radius: 6px;
    font-family: var(--font-sans);
    font-size: 1rem;
    transition: border-color var(--transition-fast);
}

.form-group input:focus,
.form-group textarea:focus {
    outline: none;
    border-color: var(--primary-red);
}

.form-group textarea {
    resize: vertical;
    min-height: 150px;
}

.submit-button {
    width: 100%;
    padding: 16px 32px;
    background: var(--primary-red);
    color: white;
    border: none;
    border-radius: 6px;
    font-family: var(--font-sans);
    font-weight: 600;
    font-size: 1rem;
    cursor: pointer;
    transition: all var(--transition-fast);
}

.submit-button:hover {
    background: #A00000;
    transform: translateY(-2px);
}
```

### Responsive Breakpoints

```css
/* Mobile: 0-767px */
@media (max-width: 767px) {
    /* Mobile styles */
}

/* Tablet: 768px-1023px */
@media (min-width: 768px) and (max-width: 1023px) {
    /* Tablet styles */
}

/* Desktop: 1024px+ */
@media (min-width: 1024px) {
    /* Desktop styles */
}
```

---

## 8. JAVASCRIPT FUNCTIONALITY

### Complete Standard JavaScript

Place this code before `</body>`:

```javascript
<script>
// 1. Enhanced Logo Fallback with Retry Mechanism
(function() {
    const logo = document.getElementById('site-logo');
    if (!logo) return;

    const logoImg = logo.querySelector('img');
    let retryCount = 0;
    const maxRetries = 2;

    function handleLogoError() {
        if (retryCount < maxRetries) {
            retryCount++;
            setTimeout(() => {
                logoImg.src = logoImg.src.split('?')[0] + '?retry=' + retryCount;
            }, 1000 * retryCount);
        } else {
            logo.classList.add('logo-failed');
        }
    }

    if (logoImg.complete && logoImg.naturalHeight === 0) {
        handleLogoError();
    }

    logoImg.addEventListener('error', handleLogoError);
    logoImg.addEventListener('load', function() {
        logo.classList.remove('logo-failed');
    });
})();

// 2. Navbar Scroll Effect
window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (!navbar) return;

    if (window.scrollY > 50) {
        navbar.style.background = 'rgba(248, 246, 243, 0.98)';
        navbar.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.1)';
    } else {
        navbar.style.background = 'rgba(248, 246, 243, 0.95)';
        navbar.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.05)';
    }
});

// 3. Smooth Scrolling for Anchor Links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href === '#') return;

        e.preventDefault();
        const target = document.querySelector(href);
        if (target) {
            const navHeight = document.querySelector('.navbar')?.offsetHeight || 80;
            const targetPosition = target.offsetTop - navHeight - 20;

            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
});

// 4. Set Active Language in Language Switcher
(function() {
    const currentLang = document.documentElement.lang;
    document.querySelectorAll('.lang-link').forEach(link => {
        if (link.getAttribute('data-lang') === currentLang) {
            link.classList.add('active');
        }
    });
})();

// 5. Analytics Tracking for Forms and CTAs
if (typeof gtag !== 'undefined') {
    // Track form submissions
    const contactForm = document.querySelector('.contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', function() {
            gtag('event', 'form_submission', {
                event_category: 'engagement',
                event_label: 'contact_form_submit'
            });
        });
    }

    // Track CTA button clicks
    document.querySelectorAll('.cta-button').forEach(button => {
        button.addEventListener('click', function() {
            const buttonText = this.textContent.trim();
            gtag('event', 'click', {
                event_category: 'engagement',
                event_label: 'cta_button_click',
                value: buttonText
            });
        });
    });

    // Track navigation link clicks
    document.querySelectorAll('.nav-link').forEach(link => {
        link.addEventListener('click', function() {
            const linkText = this.textContent.trim();
            gtag('event', 'navigation_click', {
                event_category: 'navigation',
                event_label: linkText
            });
        });
    });
}

// 6. Form Validation (if contact form exists)
(function() {
    const form = document.querySelector('.contact-form');
    if (!form) return;

    form.addEventListener('submit', function(e) {
        const email = form.querySelector('input[type="email"]');
        const name = form.querySelector('input[name="name"]');

        if (email && !email.value.includes('@')) {
            e.preventDefault();
            alert('Please enter a valid email address.');
            email.focus();
            return false;
        }

        if (name && name.value.trim().length < 2) {
            e.preventDefault();
            alert('Please enter your name.');
            name.focus();
            return false;
        }
    });
})();
</script>
```

### JavaScript Features Explained

| Feature | Purpose | Location |
|---------|---------|----------|
| Logo Fallback | Retries SVG loading, shows text if fails | All pages |
| Navbar Scroll | Changes navbar opacity on scroll | All pages |
| Smooth Scroll | Smooth anchor link scrolling | All pages |
| Language Switcher | Highlights active language | All pages |
| Analytics Tracking | Tracks forms, CTAs, navigation | All pages |
| Form Validation | Client-side form validation | Contact page |

---

## 9. SEO IMPLEMENTATION

### robots.txt Structure

**Location:** `/robots.txt`

```txt
User-agent: *
Allow: /

# Block template and development files
Disallow: /*_template.html
Disallow: /*_draft.html

# Block sensitive directories
Disallow: /admin/
Disallow: /private/
Disallow: /.git/
Disallow: /backup/
Disallow: /temp/
Disallow: /tmp/

# Block other search engines' verification files
User-agent: Googlebot
Disallow: /yandex_*.html

User-agent: Yandex
Allow: /yandex_[specific-hash].html

# Sitemap
Sitemap: https://contraco.[tld]/sitemap.xml
```

### sitemap.xml Structure

**Location:** `/sitemap.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <!-- Homepage -->
    <url>
        <loc>https://contraco.[tld]/</loc>
        <lastmod>2025-11-13</lastmod>
        <changefreq>daily</changefreq>
        <priority>1.0</priority>
    </url>

    <!-- Main Pages -->
    <url>
        <loc>https://contraco.[tld]/about.html</loc>
        <lastmod>2025-11-13</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.9</priority>
    </url>
    <url>
        <loc>https://contraco.[tld]/contact.html</loc>
        <lastmod>2025-11-13</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.9</priority>
    </url>
    <url>
        <loc>https://contraco.[tld]/insights.html</loc>
        <lastmod>2025-11-13</lastmod>
        <changefreq>weekly</changefreq>
        <priority>0.9</priority>
    </url>

    <!-- Content Pages -->
    <url>
        <loc>https://contraco.[tld]/privacy-statement.html</loc>
        <lastmod>2025-11-13</lastmod>
        <changefreq>monthly</changefreq>
        <priority>0.8</priority>
    </url>

    <!-- Add all other pages with appropriate priority... -->
</urlset>
```

### Sitemap Priority Guidelines

| Page Type | Priority | Change Frequency |
|-----------|----------|------------------|
| Homepage | 1.0 | daily |
| Main pages (about, contact, insights) | 0.9 | weekly |
| Content pages (articles) | 0.8 | weekly |
| Utility pages (thank-you, copyright) | 0.5 | monthly |

### hreflang Implementation Rules

**Critical Requirements:**

1. **Every page MUST have 5 hreflang tags:**
   - `x-default` → contraco.net (always)
   - `en` → contraco.net
   - `de` → contraco.de
   - `ru` → contraco.ru
   - `ko` → contraco.co.kr

2. **URLs must be absolute** (not relative)

3. **Must be in `<head>` section**

4. **Must match across all TLD versions**

**Example for `/about.html`:**

```html
<link rel="alternate" href="https://contraco.net/about.html" hreflang="x-default" />
<link rel="alternate" hreflang="en" href="https://contraco.net/about.html" />
<link rel="alternate" hreflang="de" href="https://contraco.de/about.html" />
<link rel="alternate" hreflang="ru" href="https://contraco.ru/about.html" />
<link rel="alternate" hreflang="ko" href="https://contraco.co.kr/about.html" />
```

### Structured Data Templates

**Organization Schema (Homepage):**

```json
{
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "contraco",
    "url": "https://contraco.[tld]/",
    "logo": "https://contraco.[tld]/Logo_rectangle.svg",
    "description": "Premium transformation consulting combining strategic clarity, technological intelligence, and psychological depth.",
    "email": "mailto:transformation@contraco.net",
    "telephone": "+1-312-940-0326",
    "address": {
        "@type": "PostalAddress",
        "streetAddress": "1209 10th Ln.",
        "addressLocality": "Ava",
        "addressRegion": "MO",
        "postalCode": "65608",
        "addressCountry": "US"
    },
    "foundingDate": "1998",
    "areaServed": ["United States", "Germany", "Russia", "Korea", "Global"]
}
```

**WebPage Schema (Content Pages):**

```json
{
    "@context": "https://schema.org",
    "@type": "WebPage",
    "name": "[Page Title]",
    "description": "[Page Description]",
    "url": "https://contraco.[tld]/[page].html",
    "publisher": {
        "@type": "Organization",
        "name": "contraco",
        "url": "https://contraco.[tld]/",
        "logo": "https://contraco.[tld]/Logo_rectangle.svg"
    }
}
```

**Article Schema (Insight Pages):**

```json
{
    "@context": "https://schema.org",
    "@type": "Article",
    "headline": "[Article Title]",
    "description": "[Article Description]",
    "author": {
        "@type": "Organization",
        "name": "contraco"
    },
    "publisher": {
        "@type": "Organization",
        "name": "contraco",
        "logo": {
            "@type": "ImageObject",
            "url": "https://contraco.[tld]/Logo_rectangle.svg"
        }
    },
    "datePublished": "2025-11-13",
    "dateModified": "2025-11-13"
}
```

---

## 10. GOOGLE ANALYTICS

### Configuration

**Tracking ID:** `G-868WGCC45D` (SAME for all TLD sites)

**Implementation:** Google Analytics 4 (GA4)

### Standard GA4 Implementation

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-868WGCC45D"></script>
<script>
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'G-868WGCC45D', {
        page_title: '[Page Title] - contraco',
        page_location: window.location.href
    });
</script>
```

### Custom Events Tracked

| Event Name | Trigger | Category | Label |
|------------|---------|----------|-------|
| `form_submission` | Form submit | engagement | contact_form_submit |
| `click` | CTA button click | engagement | cta_button_click |
| `navigation_click` | Nav link click | navigation | [link text] |

### Event Tracking Code

```javascript
// Form submission tracking
gtag('event', 'form_submission', {
    event_category: 'engagement',
    event_label: 'contact_form_submit'
});

// CTA button tracking
gtag('event', 'click', {
    event_category: 'engagement',
    event_label: 'cta_button_click',
    value: '[button text]'
});

// Navigation tracking
gtag('event', 'navigation_click', {
    event_category: 'navigation',
    event_label: '[link text]'
});
```

---

## 11. FAVICON & ICON FILES

### Complete List (25 Files)

**Standard Favicons:**
1. `favicon.ico` (3,045 bytes)
2. `favicon-16x16.png` (480 bytes)
3. `favicon-32x32.png` (1,024 bytes)
4. `favicon-96x96.png` (3,104 bytes)

**Apple Touch Icons (11 files):**
5. `apple-touch-icon.png` (6,283 bytes)
6. `apple-touch-icon-precomposed.png` (6,283 bytes)
7. `apple-touch-icon-57x57.png` (1,828 bytes)
8. `apple-touch-icon-60x60.png` (1,867 bytes)
9. `apple-touch-icon-72x72.png` (2,246 bytes)
10. `apple-touch-icon-76x76.png` (2,380 bytes)
11. `apple-touch-icon-114x114.png` (3,791 bytes)
12. `apple-touch-icon-120x120.png` (4,047 bytes)
13. `apple-touch-icon-144x144.png` (5,024 bytes)
14. `apple-touch-icon-152x152.png` (5,390 bytes)
15. `apple-touch-icon-180x180.png` (6,283 bytes)

**Android Icons (6 files):**
16. `android-icon-36x36.png` (1,157 bytes)
17. `android-icon-48x48.png` (1,487 bytes)
18. `android-icon-72x72.png` (2,246 bytes)
19. `android-icon-96x96.png` (3,104 bytes)
20. `android-icon-144x144.png` (5,024 bytes)
21. `android-icon-192x192.png` (6,740 bytes)

**Microsoft Tiles (4 files):**
22. `ms-icon-70x70.png` (2,213 bytes)
23. `ms-icon-144x144.png` (5,024 bytes)
24. `ms-icon-150x150.png` (5,173 bytes)
25. `ms-icon-310x310.png` (8,470 bytes)

### HTML Implementation

```html
<!-- COMPLETE Favicon Set -->
<link rel="icon" type="image/x-icon" href="/favicon.ico">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png">
<link rel="apple-touch-icon" href="/apple-touch-icon.png">
<link rel="manifest" href="/site.webmanifest">
<meta name="msapplication-TileColor" content="#C00000">
<meta name="msapplication-TileImage" content="/mstile-144x144.png">
<meta name="theme-color" content="#C00000">
```

### site.webmanifest Configuration

```json
{
    "name": "Contraco",
    "short_name": "Contraco",
    "icons": [
        {
            "src": "/favicon-16x16.png",
            "sizes": "16x16",
            "type": "image/png"
        },
        {
            "src": "/favicon-32x32.png",
            "sizes": "32x32",
            "type": "image/png"
        },
        {
            "src": "/favicon-96x96.png",
            "sizes": "96x96",
            "type": "image/png"
        },
        {
            "src": "/android-icon-192x192.png",
            "sizes": "192x192",
            "type": "image/png"
        }
    ],
    "theme_color": "#C00000",
    "background_color": "#ffffff",
    "display": "standalone",
    "start_url": "/",
    "scope": "/"
}
```

### browserconfig.xml Configuration

```xml
<?xml version="1.0" encoding="utf-8"?>
<browserconfig>
    <msapplication>
        <tile>
            <square70x70logo src="/ms-icon-70x70.png"/>
            <square150x150logo src="/ms-icon-150x150.png"/>
            <square310x310logo src="/ms-icon-310x310.png"/>
            <TileColor>#C00000</TileColor>
        </tile>
    </msapplication>
</browserconfig>
```

---

## 12. SVG GRAPHICS

### Complete List (6 Files)

| Filename | Size | Purpose | Color |
|----------|------|---------|-------|
| `Logo_rectangle.svg` | 2.4 KB | Primary brand logo | Red + Black |
| `arrow-right.svg` | 564 bytes | Navigation arrow | currentColor |
| `checkmark.svg` | 393 bytes | Feature checkmark | #C00000 (red) |
| `warning.svg` | 771 bytes | Warning/alert icon | currentColor |
| `strategic-clarity.svg` | 1.8 KB | Brand pillar graphic | Multi-color |
| `technological-intelligence.svg` | 6.6 KB | Brand pillar graphic | Multi-color |
| `psychological-depth.svg` | 12 KB | Brand pillar graphic | Multi-color |

### Usage Examples

**Logo in Navigation:**
```html
<img src="https://contraco.[tld]/Logo_rectangle.svg" alt="contraco">
```

**Arrow in CTA Button:**
```html
<a href="#" class="cta-button">
    Get Started
    <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
        <path d="M5 12H19M19 12L12 5M19 12L12 19"
              stroke="currentColor"
              stroke-width="2"
              stroke-linecap="round"
              stroke-linejoin="round"/>
    </svg>
</a>
```

**Checkmark in Feature List:**
```html
<li>
    <img src="/checkmark.svg" alt="✓" width="20" height="20">
    Strategic planning
</li>
```

---

## 13. PNG LOGOS

### Files

| Filename | Size | Dimensions | Purpose |
|----------|------|------------|---------|
| `Logo_rectangle.png` | 33 KB | High-res | SVG fallback |
| `contraco_logo.png` | 71 KB | High-res | Alternative logo variant |

### Usage

**Primary:** Always use `Logo_rectangle.svg` first

**Fallback:** PNG only if SVG fails to load (handled by JavaScript)

**Implementation:**
```html
<img src="https://contraco.[tld]/Logo_rectangle.svg"
     alt="contraco"
     onerror="this.src='https://contraco.[tld]/Logo_rectangle.png'">
```

---

## 14. PRIVACY & LEGAL PAGES

### Required Pages

1. **privacy-statement.html** - MANDATORY on all TLD sites
2. **copyright.html** - Optional but recommended
3. **thank-you.html** - Required for form submissions

### Privacy Statement Requirements

**Must Include:**

1. **Data Controller Information:**
   - Company name: contraco
   - Address: 1209 10th Ln., Ava, MO 65608, United States
   - Email: dpo@contraco.com
   - Phone: +1 (312) 940-0326

2. **GDPR Compliance Sections:**
   - Data Collection
   - Purpose of Data Processing
   - Legal Basis
   - Data Retention
   - Data Security
   - User Rights
   - Third-Party Services
   - International Data Transfers
   - Cookie Policy
   - Supervisory Authority
   - GDPR Rights for European Residents

3. **CCPA Compliance Sections:**
   - California Privacy Rights
   - Right to know, delete, opt-out
   - Non-discrimination statement

4. **Third-Party Services Disclosure:**
   - Google Analytics (Google LLC, USA)
   - FormSubmit (contact form processing)

### Privacy Page Footer Link

**MUST be included in footer of ALL pages:**

```html
<div class="footer-privacy-links">
    <a href="/privacy-statement.html">Privacy Statement</a>
</div>
```

---

## 15. CONTACT FORMS

### FormSubmit.co Configuration

**Endpoint:** `https://formsubmit.co/transformation@contraco.net`

### Complete Form Template

```html
<form class="contact-form" action="https://formsubmit.co/transformation@contraco.net" method="POST">
    <!-- FormSubmit Configuration -->
    <input type="hidden" name="_subject" value="New Transformation Consultation Request">
    <input type="hidden" name="_captcha" value="true">
    <input type="hidden" name="_template" value="table">
    <input type="hidden" name="_next" value="https://contraco.[tld]/thank-you.html">

    <!-- Spam Protection -->
    <input type="text" name="_honey" style="display:none" tabindex="-1" autocomplete="off">
    <input type="hidden" name="_autoresponse" value="Thank you for contacting contraco. We will respond to your inquiry within 24 hours.">

    <!-- Form Fields -->
    <div class="form-group">
        <input type="text"
               name="name"
               placeholder="Your Name"
               required
               minlength="2">
    </div>

    <div class="form-group">
        <input type="email"
               name="email"
               placeholder="Email Address"
               required>
    </div>

    <div class="form-group">
        <input type="text"
               name="organization"
               placeholder="Organization (Optional)">
    </div>

    <div class="form-group">
        <input type="tel"
               name="phone"
               placeholder="Phone (Optional)">
    </div>

    <div class="form-group">
        <textarea rows="5"
                  name="message"
                  placeholder="Tell us about your transformation goals"
                  required
                  minlength="10"></textarea>
    </div>

    <button type="submit" class="submit-button">Send Message</button>
</form>
```

### FormSubmit Configuration Options

| Field | Value | Purpose |
|-------|-------|---------|
| `_subject` | "New Transformation Consultation Request" | Email subject line |
| `_captcha` | "true" | Enable spam protection |
| `_template` | "table" | Email format (table layout) |
| `_next` | "https://contraco.[tld]/thank-you.html" | Redirect after submit |
| `_honey` | Hidden field | Honeypot spam trap |
| `_autoresponse` | Custom message | Auto-reply to submitter |

### Thank You Page

**File:** `thank-you.html`

**Must Include:**
- Confirmation message
- Expected response time (24 hours)
- Link back to homepage
- Contact email: transformation@contraco.net

---

## 16. REGIONAL VARIATIONS

### Language-Specific Content

| TLD | Language Code | Primary Font | Additional Fonts |
|-----|---------------|--------------|------------------|
| .net | en | Inter | None |
| .de | de | Inter | None |
| .ru | ru | Inter | None |
| .co.kr | ko | Inter | Noto Sans KR |

### Korean Site Font Addition

**Add to Google Fonts link:**
```html
<link href="https://fonts.googleapis.com/css2?family=Crimson+Text:ital,wght@0,400;0,600;1,400&family=Inter:wght@300;400;500;600;700&family=Noto+Sans+KR:wght@300;400;500;600;700&display=swap" rel="stylesheet">
```

**Update CSS variable:**
```css
--font-sans: 'Noto Sans KR', 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
```

### Verification Files (Unique per TLD)

**Different for each site:**
- Yandex verification HTML file (different hash per TLD)
- Search engine text verification file (different hash per TLD)

**Example:**
- contraco.net: `yandex_3ab46e6433c1642a.html`
- contraco.de: `yandex_9d09ebb2e4daf7cb.html`
- contraco.ru: `yandex_6df8be02293d6328.html`
- contraco.co.kr: `yandex_aeacfa9e17557ac0.html`

### Translation Guidelines

**Navigation Links:**
| English | German | Russian | Korean |
|---------|--------|---------|--------|
| Services | Leistungen | Услуги | 서비스 |
| Methodology | Methodik | Методология | 방법론 |
| Insights | Einblicke | Аналитика | 인사이트 |
| About | Über uns | О нас | 회사 소개 |
| Contact | Kontakt | Контакты | 연락처 |

**Form Labels:**
| English | German | Russian | Korean |
|---------|--------|---------|--------|
| Your Name | Ihr Name | Ваше имя | 이름 |
| Email Address | E-Mail-Adresse | Email адрес | 이메일 주소 |
| Organization | Organisation | Организация | 조직 |
| Phone | Telefon | Телефон | 전화번호 |
| Message | Nachricht | Сообщение | 메시지 |
| Send Message | Nachricht senden | Отправить | 메시지 전송 |

---

## 17. CREATING NEW PAGES CHECKLIST

### Pre-Creation

- [ ] Determine page purpose and content structure
- [ ] Choose appropriate page template (content page, article, service)
- [ ] Prepare all content (text, images)
- [ ] Decide on URL/filename (use lowercase, hyphens)

### HTML Structure

- [ ] Copy complete `<head>` template (Section 4)
- [ ] Update page title in `<title>` tag
- [ ] Update canonical URL
- [ ] Update all 5 hreflang tags (x-default + 4 languages)
- [ ] Update Open Graph tags
- [ ] Update structured data (Schema.org)
- [ ] Update Google Analytics page_title parameter

### Content

- [ ] Include standard navigation (Section 5)
- [ ] Include standard footer (Section 6)
- [ ] Use CSS variables for styling (Section 7)
- [ ] Include standard JavaScript (Section 8)
- [ ] Add hero section (if applicable)
- [ ] Add main content sections
- [ ] Add CTA buttons

### SEO

- [ ] Write meta description (150-160 characters)
- [ ] Add meta keywords
- [ ] Add alt text to all images
- [ ] Ensure proper heading hierarchy (H1 → H2 → H3)
- [ ] Add internal links to other pages

### Multi-TLD Implementation

- [ ] Create same page on contraco-net
- [ ] Create same page on contraco-de (translate content)
- [ ] Create same page on contraco-ru (translate content)
- [ ] Create same page on contraco-kr (translate content)
- [ ] Verify hreflang tags match across all versions

### Post-Creation

- [ ] Add page to sitemap.xml (all 4 TLDs)
- [ ] Update sitemap lastmod date
- [ ] Test page on all devices (desktop, tablet, mobile)
- [ ] Test all links (navigation, internal, external)
- [ ] Test form submission (if applicable)
- [ ] Validate HTML (https://validator.w3.org/)
- [ ] Test page load speed
- [ ] Verify Google Analytics tracking

### Git & Deployment

- [ ] Commit changes to git
- [ ] Push to GitHub
- [ ] Verify deployment on GitHub Pages
- [ ] Test live page on actual domain

---

## 18. REUSABLE CODE SNIPPETS

### Hero Section

```html
<section class="hero">
    <div class="container">
        <h1>[Hero Title]</h1>
        <p class="hero-subtitle">[Hero Subtitle]</p>
        <div class="hero-cta">
            <a href="#contact" class="cta-button">
                Get Started
                <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                    <path d="M5 12H19M19 12L12 5M19 12L12 19"
                          stroke="currentColor"
                          stroke-width="2"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
            </a>
            <a href="/insights.html" class="secondary-button">Learn More</a>
        </div>
    </div>
</section>

<style>
.hero {
    padding: 160px 0 100px;
    text-align: center;
    background: linear-gradient(135deg, var(--warm-white) 0%, var(--warm-gray-light) 100%);
}

.hero h1 {
    font-size: 4.2rem;
    margin-bottom: 24px;
}

.hero-subtitle {
    font-size: 1.4rem;
    color: var(--warm-gray-dark);
    max-width: 700px;
    margin: 0 auto 40px;
    line-height: 1.6;
}

.hero-cta {
    display: flex;
    gap: 20px;
    justify-content: center;
    flex-wrap: wrap;
}

@media (max-width: 768px) {
    .hero {
        padding: 120px 0 60px;
    }

    .hero h1 {
        font-size: 2.5rem;
    }

    .hero-subtitle {
        font-size: 1.1rem;
    }
}
</style>
```

### Content Section with Grid

```html
<section class="content-section" id="services">
    <div class="container">
        <h2 class="section-title">[Section Title]</h2>
        <p class="section-intro">[Section Introduction]</p>

        <div class="cards-grid">
            <div class="service-card">
                <h3>[Service Title]</h3>
                <p>[Service Description]</p>
                <ul class="service-features">
                    <li>[Feature 1]</li>
                    <li>[Feature 2]</li>
                    <li>[Feature 3]</li>
                </ul>
            </div>

            <div class="service-card">
                <h3>[Service Title]</h3>
                <p>[Service Description]</p>
                <ul class="service-features">
                    <li>[Feature 1]</li>
                    <li>[Feature 2]</li>
                    <li>[Feature 3]</li>
                </ul>
            </div>

            <div class="service-card">
                <h3>[Service Title]</h3>
                <p>[Service Description]</p>
                <ul class="service-features">
                    <li>[Feature 1]</li>
                    <li>[Feature 2]</li>
                    <li>[Feature 3]</li>
                </ul>
            </div>
        </div>
    </div>
</section>

<style>
.content-section {
    padding: 100px 0;
    background: white;
}
</style>
```

### CTA Section

```html
<section class="cta-section">
    <div class="container">
        <h2>[CTA Headline]</h2>
        <p>[CTA Description]</p>
        <a href="#contact" class="cta-button">
            [Button Text]
            <svg width="20" height="20" viewBox="0 0 24 24" fill="none">
                <path d="M5 12H19M19 12L12 5M19 12L12 19"
                      stroke="currentColor"
                      stroke-width="2"
                      stroke-linecap="round"
                      stroke-linejoin="round"/>
            </svg>
        </a>
    </div>
</section>

<style>
.cta-section {
    padding: 100px 0;
    background: linear-gradient(135deg, var(--primary-red) 0%, #A00000 100%);
    color: white;
    text-align: center;
}

.cta-section h2 {
    color: white;
    font-size: 2.8rem;
    margin-bottom: 20px;
}

.cta-section p {
    color: rgba(255, 255, 255, 0.9);
    font-size: 1.2rem;
    max-width: 700px;
    margin: 0 auto 40px;
}

.cta-section .cta-button {
    background: white;
    color: var(--primary-red);
}

.cta-section .cta-button:hover {
    background: var(--warm-white);
}
</style>
```

### Article Content Template

```html
<article class="article-content">
    <div class="container">
        <header class="article-header">
            <h1>[Article Title]</h1>
            <div class="article-meta">
                <span class="article-date">[Date]</span>
                <span class="article-reading-time">[X] min read</span>
            </div>
        </header>

        <div class="article-body">
            <p class="article-intro">[Introduction paragraph]</p>

            <h2>[Section Heading]</h2>
            <p>[Content paragraph]</p>

            <h3>[Subsection Heading]</h3>
            <p>[Content paragraph]</p>

            <ul class="article-list">
                <li>[List item 1]</li>
                <li>[List item 2]</li>
                <li>[List item 3]</li>
            </ul>

            <blockquote class="article-quote">
                <p>[Quote text]</p>
            </blockquote>

            <div class="article-cta">
                <h3>[CTA Heading]</h3>
                <p>[CTA Description]</p>
                <a href="#contact" class="cta-button">[CTA Button]</a>
            </div>
        </div>
    </div>
</article>

<style>
.article-content {
    padding: 140px 0 100px;
    background: white;
}

.article-header {
    text-align: center;
    margin-bottom: 60px;
}

.article-header h1 {
    font-size: 3.5rem;
    margin-bottom: 20px;
}

.article-meta {
    display: flex;
    gap: 20px;
    justify-content: center;
    color: var(--warm-gray-medium);
    font-size: 0.95rem;
}

.article-body {
    max-width: 800px;
    margin: 0 auto;
}

.article-intro {
    font-size: 1.2rem;
    color: var(--warm-gray-dark);
    margin-bottom: 40px;
    line-height: 1.7;
}

.article-body h2 {
    font-size: 2.2rem;
    margin: 60px 0 24px;
    color: var(--deep-charcoal);
}

.article-body h3 {
    font-size: 1.6rem;
    margin: 40px 0 20px;
    color: var(--deep-charcoal);
}

.article-body p {
    font-size: 1.05rem;
    line-height: 1.8;
    margin-bottom: 20px;
}

.article-list {
    margin: 30px 0;
    padding-left: 0;
    list-style: none;
}

.article-list li {
    position: relative;
    padding-left: 30px;
    margin-bottom: 12px;
    line-height: 1.6;
}

.article-list li::before {
    content: '→';
    position: absolute;
    left: 0;
    color: var(--primary-red);
    font-weight: bold;
}

.article-quote {
    margin: 40px 0;
    padding: 30px;
    background: var(--warm-gray-light);
    border-left: 4px solid var(--primary-red);
    font-style: italic;
    font-size: 1.1rem;
}

.article-cta {
    margin-top: 60px;
    padding: 50px;
    background: linear-gradient(135deg, var(--warm-white) 0%, var(--warm-gray-light) 100%);
    border-radius: 12px;
    text-align: center;
}

.article-cta h3 {
    margin-top: 0;
    margin-bottom: 16px;
    color: var(--deep-charcoal);
}

.article-cta p {
    margin-bottom: 30px;
    color: var(--warm-gray-dark);
}

@media (max-width: 768px) {
    .article-header h1 {
        font-size: 2.2rem;
    }

    .article-body h2 {
        font-size: 1.8rem;
    }

    .article-cta {
        padding: 30px 20px;
    }
}
</style>
```

---

## 19. BRAND GUIDELINES

### Colors

| Color | Hex | Usage |
|-------|-----|-------|
| Primary Red | #C00000 | Logos, CTAs, accents, links |
| Deep Charcoal | #404040 | Headings, body text, dark backgrounds |
| Warm White | #F8F6F3 | Main background color |
| Warm Gray Light | #E5E2DD | Subtle backgrounds, dividers |
| Warm Gray Medium | #A8A5A0 | Secondary text, muted elements |
| Warm Gray Dark | #6B6B6B | Body text, paragraph text |

### Typography

**Headings:**
- Font: Crimson Text (serif)
- Weights: 400 (regular), 600 (semi-bold)
- Usage: H1, H2, H3, brand elements

**Body Text:**
- Font: Inter (sans-serif)
- Weights: 300, 400, 500, 600, 700
- Usage: Navigation, body text, UI elements

**Korean Site:**
- Add: Noto Sans KR
- Same weight range as Inter

### Logo

**Primary:** Logo_rectangle.svg
- Height: 58px in navigation
- Height: 40-50px in headers
- Always implement with fallback mechanism

**Colors:**
- Red (#C00000) for "contraco"
- Black for rectangular border

**Clear Space:** Minimum 20px around logo

### Voice & Tone

**Professional but Human:**
- Direct and conversational
- Confident without arrogance
- Expertise balanced with empathy

**Key Phrases:**
- "Transformation you can feel"
- "27 years of digital excellence"
- "Give 51% value, take 49% return"
- "Strategic clarity, technological intelligence, psychological depth"

**Established:** 1998

**Tagline:** "Premium Transformation Consulting"

**Trademark:** "The Resonance Method™"

### Design Principles

1. **Clarity:** Clean layouts, ample white space
2. **Consistency:** Standardized components across all pages
3. **Professionalism:** Premium feel, high-quality visuals
4. **Accessibility:** Readable text, sufficient contrast
5. **Responsiveness:** Perfect on all device sizes

---

## 20. QUICK REFERENCE

### Essential URLs

| Site | URL | Purpose |
|------|-----|---------|
| Hub | https://contraco.com | Market selector |
| US/Global | https://contraco.net | English site |
| Germany | https://contraco.de | German site |
| Russia | https://contraco.ru | Russian site |
| Korea | https://contraco.co.kr | Korean site |

### Contact Information

| Type | Value |
|------|-------|
| General Email | transformation@contraco.net |
| Data Protection | dpo@contraco.com |
| Phone | +1 (312) 940-0326 |
| Address | 1209 10th Ln., Ava, MO 65608, United States |

### Key Technical Details

| Item | Value |
|------|-------|
| Google Analytics ID | G-868WGCC45D |
| Form Endpoint | https://formsubmit.co/transformation@contraco.net |
| Primary Logo | Logo_rectangle.svg |
| Container Max Width | 1200px |
| Mobile Breakpoint | 768px |
| Primary Color | #C00000 |
| Font (Sans) | Inter |
| Font (Serif) | Crimson Text |

### File Counts

| Type | Count |
|------|-------|
| HTML Pages | 18 |
| Icon Files | 25 |
| SVG Graphics | 6 |
| Total Files | ~50-55 |

### Standard Sections Every Page Needs

1. Complete `<head>` with all meta tags
2. Fixed navigation bar
3. Main content area
4. Footer with privacy link
5. Standard JavaScript
6. Google Analytics

### GitHub Repositories

```
https://github.com/contraco/contraco-com
https://github.com/contraco/contraco-net
https://github.com/contraco/contraco-de
https://github.com/contraco/contraco-ru
https://github.com/contraco/contraco-kr
```

---

## CONCLUSION

This briefing document provides **complete technical specifications** for creating or modifying HTML documents across all contraco TLD sites.

### Key Takeaways

1. **All TLD sites share identical structure** - only content varies by language
2. **Flat file structure** - no subdirectories
3. **Inline CSS** - styles embedded in each HTML file
4. **25 favicon files** - comprehensive cross-platform icon support
5. **Multi-regional SEO** - complete hreflang implementation required
6. **Single Google Analytics ID** - same tracking across all sites
7. **FormSubmit.co** - standardized contact form setup
8. **Logo fallback mechanism** - JavaScript retry logic for SVG loading

### For Quick Page Creation

1. Copy Section 4 (Complete HTML Head)
2. Copy Section 5 (Navigation)
3. Copy Section 6 (Footer)
4. Copy Section 7 (CSS Variables & Design System)
5. Copy Section 8 (JavaScript Functionality)
6. Replace all `[tld]` and `[page]` placeholders
7. Add your content in between navigation and footer
8. Update sitemap.xml
9. Deploy to all 4 TLD sites with translated content

### Support

For questions or clarifications about this briefing document:
- Email: transformation@contraco.net
- GitHub: https://github.com/contraco

**Document Version:** 1.0
**Last Updated:** November 13, 2025
**Maintained By:** contraco team
