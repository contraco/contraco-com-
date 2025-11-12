#!/usr/bin/env node

/**
 * contraco Multi-Site Builder
 * Builds all 5 TLD websites from one unified codebase
 *
 * Usage:
 *   node build-all-sites.js              # Build all sites
 *   node build-all-sites.js net          # Build only contraco-net
 *   node build-all-sites.js net de kr    # Build specific sites
 */

const fs = require('fs-extra');
const path = require('path');
const { execSync } = require('child_process');

// Configuration for all TLD sites
const sites = {
  net: {
    url: 'https://contraco.net',
    lang: 'en',
    domain: 'contraco.net',
    tagline: 'Established 1998 • Premium Transformation Consulting',
    description: 'Strategic Clarity • Technological Intelligence • Psychological Depth',
    privacyLinkText: 'Privacy Statement',
    trademark: 'The Resonance Method™ is a trademark of contraco.'
  },
  de: {
    url: 'https://contraco.de',
    lang: 'de',
    domain: 'contraco.de',
    tagline: 'Gegründet 1998 • Premium Transformationsberatung',
    description: 'Strategische Klarheit • Technologische Intelligenz • Psychologische Tiefe',
    privacyLinkText: 'Datenschutzerklärung',
    trademark: 'The Resonance Method™ ist eine Marke von contraco.'
  },
  kr: {
    url: 'https://contraco.co.kr',
    lang: 'ko',
    domain: 'contraco.co.kr',
    tagline: '1998년 설립 • 프리미엄 혁신 컨설팅',
    description: '전략적 명확성 • 기술 지능 • 심리적 깊이',
    privacyLinkText: '개인정보 처리방침',
    trademark: 'The Resonance Method™는 contraco의 상표입니다.'
  },
  ru: {
    url: 'https://contraco.ru',
    lang: 'ru',
    domain: 'contraco.ru',
    tagline: 'Основана в 1998 году • Премиум-консалтинг трансформации',
    description: 'Стратегическая ясность • Технологический интеллект • Психологическая глубина',
    privacyLinkText: 'Политика конфиденциальности',
    trademark: 'The Resonance Method™ является торговой маркой contraco.'
  },
  com: {
    url: 'https://contraco.com',
    lang: 'en',
    domain: 'contraco.com',
    tagline: 'Established 1998 • Premium Transformation Consulting',
    description: 'Strategic Clarity • Technological Intelligence • Psychological Depth',
    privacyLinkText: 'Privacy Statement',
    trademark: 'The Resonance Method™ is a trademark of contraco.'
  }
};

const gaTrackingId = 'G-868WGCC45D';
const showLanguageSelector = true;

// Parse command line arguments
const args = process.argv.slice(2);
const sitesToBuild = args.length > 0 ? args : Object.keys(sites);

// Validate arguments
for (const site of sitesToBuild) {
  if (!sites[site]) {
    console.error(`❌ Unknown site: ${site}`);
    console.error(`   Valid sites: ${Object.keys(sites).join(', ')}`);
    process.exit(1);
  }
}

console.log('═══════════════════════════════════════════════════════════');
console.log('  contraco Multi-Site Builder');
console.log('═══════════════════════════════════════════════════════════');
console.log('');
console.log(`Building ${sitesToBuild.length} site(s): ${sitesToBuild.join(', ')}`);
console.log('');

// Build each site
for (const siteKey of sitesToBuild) {
  const config = sites[siteKey];

  console.log(`📦 Building contraco-${siteKey}...`);
  console.log(`   URL: ${config.url}`);
  console.log(`   Language: ${config.lang}`);

  try {
    // Create site-specific data file
    const siteData = {
      url: config.url,
      lang: config.lang,
      gaTrackingId: gaTrackingId,
      tagline: config.tagline,
      description: config.description,
      privacyLinkText: config.privacyLinkText,
      trademark: config.trademark,
      showLanguageSelector: showLanguageSelector
    };

    // Write site.json
    const dataDir = path.join(__dirname, 'src', '_data');
    fs.ensureDirSync(dataDir);
    fs.writeJsonSync(
      path.join(dataDir, 'site.json'),
      siteData,
      { spaces: 2 }
    );

    // Build with 11ty
    console.log('   Building...');
    execSync('npx @11ty/eleventy --quiet', {
      stdio: 'inherit',
      cwd: __dirname
    });

    // Move output to site-specific folder
    const outputDir = path.join(__dirname, 'dist', siteKey);
    fs.ensureDirSync(outputDir);
    fs.emptyDirSync(outputDir);
    fs.copySync(path.join(__dirname, '_site'), outputDir);

    console.log(`   ✅ Built to dist/${siteKey}/`);
    console.log('');

  } catch (error) {
    console.error(`   ❌ Build failed for ${siteKey}:`);
    console.error(error.message);
    process.exit(1);
  }
}

console.log('═══════════════════════════════════════════════════════════');
console.log('✅ All sites built successfully!');
console.log('═══════════════════════════════════════════════════════════');
console.log('');
console.log('📁 Output directories:');
for (const siteKey of sitesToBuild) {
  console.log(`   dist/${siteKey}/ → Deploy to ${sites[siteKey].domain}`);
}
console.log('');
console.log('📋 Next steps:');
console.log('   1. Test each site locally');
console.log('   2. Copy dist/net/ contents to contraco-net repo');
console.log('   3. Copy dist/de/ contents to contraco-de repo');
console.log('   4. (etc. for kr, ru, com)');
console.log('   5. Commit and push each repo');
console.log('');
