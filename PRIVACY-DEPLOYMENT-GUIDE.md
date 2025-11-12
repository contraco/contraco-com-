# Privacy Statement Deployment Guide

## Files Created

1. **privacy-statement.html** - English version for contraco-com ✅ IN REPO
2. **privacy-statement-net.html** - English version for contraco-net (TO DEPLOY)
3. **privacy-statement-ru.html** - Russian version for contraco-ru (TO DEPLOY + TRANSLATE)
4. **privacy-statement-kr.html** - Korean version for contraco-kr (TO DEPLOY + TRANSLATE)
5. **privacy-statement-de.html** - German version for contraco-de (TO DEPLOY + TRANSLATE)

## Deployment Instructions

### For contraco-net (English - Ready to Deploy):
```bash
cd /path/to/contraco-net
cp /path/to/contraco-com/privacy-statement-net.html ./privacy-statement.html
git add privacy-statement.html
git commit -m "Add privacy statement page"
git push
```

### For contraco-ru (Russian - Needs Translation):
```bash
cd /path/to/contraco-ru
cp /path/to/contraco-com/privacy-statement-ru.html ./privacy-statement.html
# Translate the content to Russian
git add privacy-statement.html
git commit -m "Add Russian privacy statement page"
git push
```

### For contraco-kr (Korean - Needs Translation):
```bash
cd /path/to/contraco-kr
cp /path/to/contraco-com/privacy-statement-kr.html ./privacy-statement.html
# Translate the content to Korean
git add privacy-statement.html
git commit -m "Add Korean privacy statement page"
git push
```

### For contraco-de (German - Needs Translation):
```bash
cd /path/to/contraco-de
cp /path/to/contraco-com/privacy-statement-de.html ./privacy-statement.html
# Translate the content to German
git add privacy-statement.html
git commit -m "Add German privacy statement page"
git push
```

## Localization Notes

- Each file uses the appropriate lang attribute (en, ru, ko, de)
- Korean version includes Noto Sans KR font
- All files include proper hreflang tags pointing to all TLDs
- Contact information is consistent across all versions
- Domain references updated for each TLD
- **IMPORTANT:** RU, KR, and DE versions contain English text that MUST be professionally translated

## Translation Requirements

The privacy statement is a **legal document**. Professional translation is strongly recommended for:
- **German (DE):** GDPR compliance critical for European markets
- **Russian (RU):** Legal accuracy important for Russian market
- **Korean (KR):** Legal accuracy important for Korean market

### Sections Requiring Translation:
1. All headings and titles
2. Legal rights descriptions (GDPR, CCPA)
3. Data collection and processing explanations
4. User rights sections
5. Cookie policy details
6. Contact and complaint procedures

### Technical Elements (DO NOT TRANSLATE):
- Email addresses (dpo@contraco.com, transformation@contraco.net)
- Phone numbers
- Physical addresses
- Company name "contraco"
- Legal references (Article 6(1)(a) GDPR, etc.)
- Technology names (Google Analytics, SSL/TLS, etc.)

## Next Steps

### Immediate Actions:
1. **Deploy contraco-net** - Ready to use (English) ✅
2. **Get professional translation** - Send RU, KR, DE versions to translation service
3. **Deploy translated versions** - After translation is complete
4. **Update sitemaps** - Add privacy-statement.html to each sitemap.xml
5. **Verify footer links** - Privacy links are already included in files

### Technical Verification:
- All files have correct `lang` attributes
- All files have proper hreflang tags
- Korean version has Noto Sans KR font
- All domain references are updated correctly
- All navigation links point to correct domains

### After Deployment:
- Test all privacy links from footer
- Verify page loads correctly on each TLD
- Check mobile responsiveness
- Ensure all internal links work
- Validate HTML
- Check analytics tracking

##Translation Service Recommendations

1. **DeepL Pro** - Good for DE translations (GDPR-compliant)
2. **Professional legal translator** - Recommended for all versions
3. **Native speaker review** - Essential for legal accuracy

## File Sizes

All files are approximately 23KB each.
