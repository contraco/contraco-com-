# UPDATE-FILES.ps1
# Run this script to update key files to the latest version

Write-Host "Updating PHASE2-11ty-setup files..." -ForegroundColor Green

# Update index.njk
$indexContent = @'
---
layout: base.njk
title: contraco - Global Transformation Consulting
description: "Choose your contraco market: Global (English), Deutschland (Deutsch), Россия (Русский), 대한민국 (한국어). Premium transformation consulting since 1998."
gaPageTitle: contraco - Global Transformation Consulting
---

<section class="market-selector">
    <h2 class="selector-title">Choose Your Market</h2>
    <p class="selector-subtitle">Select your preferred language and regional site</p>

    <div class="markets-grid">
        <a href="https://contraco.net/" class="market-card featured">
            <div class="market-code">US</div>
            <div class="market-name">Global</div>
            <div class="market-language">English</div>
            <div class="market-url">contraco.net</div>
        </a>

        <a href="https://contraco.de/" class="market-card">
            <div class="market-code">DE</div>
            <div class="market-name">Deutschland</div>
            <div class="market-language">Deutsch</div>
            <div class="market-url">contraco.de</div>
        </a>

        <a href="https://contraco.ru/" class="market-card">
            <div class="market-code">RU</div>
            <div class="market-name">Россия</div>
            <div class="market-language">Русский</div>
            <div class="market-url">contraco.ru</div>
        </a>

        <a href="https://contraco.co.kr/" class="market-card">
            <div class="market-code">KR</div>
            <div class="market-name">대한민국</div>
            <div class="market-language">한국어</div>
            <div class="market-url">contraco.co.kr</div>
        </a>
    </div>
</section>
'@

$indexContent | Out-File -FilePath "src\index.njk" -Encoding UTF8

# Update header.njk
$headerContent = @'
<header class="header">
    <div class="container">
        <div class="logo" id="site-logo">
            <img src="/Logo_rectangle.svg"
                 alt="contraco"
                 onerror="this.parentElement.classList.add('logo-failed');">
            <span class="logo-fallback">contraco</span>
        </div>
        <h1 class="header-title">Global Transformation Consulting</h1>
        <p class="header-subtitle">27+ Years of Digital Excellence</p>
    </div>
</header>
'@

$headerContent | Out-File -FilePath "src\_includes\header.njk" -Encoding UTF8

Write-Host "✅ Files updated successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Now run:" -ForegroundColor Yellow
Write-Host "  npm run build" -ForegroundColor Cyan
Write-Host "  npm run serve:com" -ForegroundColor Cyan
