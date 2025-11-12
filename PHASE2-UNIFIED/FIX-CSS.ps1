# FIX-CSS.ps1 - Replace broken CSS file with complete version

Write-Host "Fixing CSS file..." -ForegroundColor Yellow

$cssContent = @'
/* CSS Variables */
:root {
    --primary-red: #C00000;
    --deep-charcoal: #404040;
    --warm-white: #F8F6F3;
    --warm-gray-light: #E5E2DD;
    --warm-gray-medium: #A8A5A0;
    --warm-gray-dark: #6B6B6B;
    --font-serif: 'Crimson Text', Georgia, serif;
    --font-sans: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    --shadow-medium: 0 8px 30px rgba(0, 0, 0, 0.08);
    --shadow-hover: 0 20px 60px rgba(0, 0, 0, 0.15);
}

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
    background: linear-gradient(135deg, var(--warm-white) 0%, var(--warm-gray-light) 100%);
    min-height: 100vh;
}

/* FIXED HEADER DESIGN */
.header {
    background: var(--warm-white);
    padding: 40px 0 60px;
    text-align: center;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
    margin-bottom: 80px;
}

.logo {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 20px;
}

.logo img {
    height: 50px;
    width: auto;
    transition: opacity 0.3s ease;
}

.logo-fallback {
    font-size: 2.5rem;
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

.header-title {
    font-size: 1.8rem;
    font-weight: 500;
    color: var(--deep-charcoal);
    margin-bottom: 8px;
    font-family: var(--font-sans);
}

.header-subtitle {
    font-size: 1.1rem;
    color: var(--warm-gray-dark);
    font-weight: 300;
}

/* Main Content */
.container {
    max-width: 1000px;
    margin: 0 auto;
    padding: 0 40px;
}

.market-selector {
    text-align: center;
}

.selector-title {
    font-size: 2.5rem;
    font-weight: 600;
    color: var(--deep-charcoal);
    margin-bottom: 16px;
    font-family: var(--font-serif);
}

.selector-subtitle {
    font-size: 1.2rem;
    color: var(--warm-gray-dark);
    margin-bottom: 60px;
    font-weight: 300;
}

.markets-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 30px;
    margin-bottom: 80px;
    max-width: 900px;
    margin-left: auto;
    margin-right: auto;
}

.market-card {
    background: white;
    border-radius: 12px;
    padding: 40px 30px;
    text-decoration: none;
    color: inherit;
    transition: all 0.3s ease;
    box-shadow: var(--shadow-medium);
    border: 2px solid transparent;
    position: relative;
    overflow: hidden;
}

.market-card:hover {
    transform: translateY(-8px);
    box-shadow: var(--shadow-hover);
    border-color: var(--primary-red);
    text-decoration: none;
    color: inherit;
}

.market-card.featured {
    border-color: var(--primary-red);
    background: linear-gradient(135deg, white 0%, rgba(192, 0, 0, 0.02) 100%);
}

.market-code {
    font-size: 3rem;
    font-weight: 700;
    color: var(--deep-charcoal);
    margin-bottom: 12px;
    font-family: var(--font-serif);
}

.market-name {
    font-size: 1.4rem;
    font-weight: 600;
    color: var(--deep-charcoal);
    margin-bottom: 8px;
}

.market-language {
    font-size: 1rem;
    color: var(--warm-gray-medium);
    margin-bottom: 16px;
}

.market-url {
    font-size: 0.9rem;
    color: var(--primary-red);
    font-weight: 500;
}

/* Footer */
.footer {
    background: var(--deep-charcoal);
    color: var(--warm-gray-light);
    padding: 50px 0;
    text-align: center;
}

.footer-content {
    max-width: 800px;
    margin: 0 auto;
    padding: 0 40px;
}

.footer-tagline {
    font-size: 1.1rem;
    margin-bottom: 16px;
    color: white;
}

.footer-description {
    font-size: 0.95rem;
    line-height: 1.7;
    color: var(--warm-gray-medium);
}

.footer-bottom {
    margin-top: 40px;
    padding-top: 30px;
    border-top: 1px solid rgba(255, 255, 255, 0.15);
    text-align: center;
}

.footer-bottom p {
    margin: 0;
    color: var(--warm-gray-light);
    font-size: 0.9rem;
}

.footer-privacy-links {
    margin-top: 24px;
    padding-top: 20px;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    text-align: center;
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
    margin-top: 8px;
    font-size: 0.8rem;
    opacity: 0.8;
}

/* Responsive Design */
@media (max-width: 768px) {
    .container,
    .footer-content {
        padding: 0 20px;
    }

    .header {
        padding: 30px 0 40px;
        margin-bottom: 50px;
    }

    .header-title {
        font-size: 1.4rem;
    }

    .header-subtitle {
        font-size: 1rem;
    }

    .selector-title {
        font-size: 2rem;
    }

    .selector-subtitle {
        font-size: 1.1rem;
        margin-bottom: 40px;
    }

    .markets-grid {
        grid-template-columns: 1fr;
        gap: 20px;
        margin-bottom: 60px;
    }

    .market-card {
        padding: 30px 20px;
    }

    .market-code {
        font-size: 2.5rem;
    }
}
'@

# Write CSS file with UTF8 encoding (no BOM)
[System.IO.File]::WriteAllText("$PSScriptRoot\src\css\styles.css", $cssContent, (New-Object System.Text.UTF8Encoding $false))

Write-Host "✅ CSS file fixed! (278 lines, 5.2KB)" -ForegroundColor Green
Write-Host ""
Write-Host "Now run:" -ForegroundColor Yellow
Write-Host "  npm run build" -ForegroundColor Cyan
Write-Host "  npm run serve:com" -ForegroundColor Cyan
