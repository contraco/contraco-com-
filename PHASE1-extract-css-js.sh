#!/bin/bash

# PHASE 1: Extract CSS and JavaScript to External Files
# This script extracts inline CSS and JS from HTML files
# Usage: ./PHASE1-extract-css-js.sh

set -e

REPO_DIR="$1"
if [ -z "$REPO_DIR" ]; then
    echo "Usage: ./PHASE1-extract-css-js.sh /path/to/contraco-net"
    exit 1
fi

cd "$REPO_DIR"
echo "Working in: $(pwd)"
echo ""

# Backup original files
echo "📦 Creating backup..."
mkdir -p .backup-$(date +%Y%m%d)
cp *.html .backup-$(date +%Y%m%d)/ 2>/dev/null || true
echo "✅ Backup created in .backup-$(date +%Y%m%d)/"
echo ""

# Extract CSS from index.html (use as reference)
echo "🎨 Extracting CSS..."
if [ -f "index.html" ]; then
    sed -n '/<style>/,/<\/style>/p' index.html | \
        sed '1d;$d' > styles.css
    echo "✅ Created styles.css ($(wc -l < styles.css) lines)"
else
    echo "❌ index.html not found"
    exit 1
fi
echo ""

# Extract common JavaScript (logo fallback + navigation)
echo "⚡ Extracting common JavaScript..."
cat > scripts.js << 'JSEOF'
// Enhanced logo fallback with retry mechanism
(function() {
    const logo = document.getElementById('site-logo');
    if (!logo) return;

    const img = logo.querySelector('img');
    if (!img) return;

    let retryCount = 0;
    const maxRetries = 2;

    function retryLoadLogo() {
        retryCount++;
        if (retryCount <= maxRetries) {
            img.src = img.src + '?retry=' + retryCount;
        } else {
            logo.classList.add('logo-failed');
        }
    }

    img.addEventListener('error', function() {
        if (!logo.classList.contains('logo-failed')) {
            setTimeout(retryLoadLogo, 1000 * retryCount);
        }
    });
})();

// Mobile menu toggle (if applicable)
(function() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const navMenu = document.querySelector('.nav-menu');

    if (mobileMenuBtn && navMenu) {
        mobileMenuBtn.addEventListener('click', function() {
            navMenu.classList.toggle('active');
        });
    }
})();
JSEOF

echo "✅ Created scripts.js"
echo ""

# Create updated HTML template helper
echo "📝 Creating update script..."
cat > update-html-files.sh << 'UPDATEEOF'
#!/bin/bash
# Updates HTML files to use external CSS/JS

for file in *.html; do
    # Skip yandex verification files
    if [[ "$file" == yandex*.html ]]; then
        continue
    fi

    echo "Processing $file..."

    # Create temporary file
    tmpfile="${file}.tmp"

    # Replace <style>...</style> with link to external CSS
    sed '/<style>/,/<\/style>/c\    <link rel="stylesheet" href="/styles.css">' "$file" > "$tmpfile"

    # Replace inline script (logo fallback) with external JS reference
    # This is more complex - we'll add the script tag before </body>
    # For now, manually review and add: <script src="/scripts.js"></script> before </body>

    mv "$tmpfile" "$file"
done

echo ""
echo "⚠️  IMPORTANT: Manual steps required:"
echo "1. Review each HTML file"
echo "2. Remove duplicate inline <script> blocks (logo fallback, etc.)"
echo "3. Add <script src=\"/scripts.js\"></script> before </body> if not present"
echo "4. Keep page-specific GA tracking in <head>"
echo ""
UPDATEEOF

chmod +x update-html-files.sh

echo "✅ Created update-html-files.sh"
echo ""

echo "═══════════════════════════════════════════════════════════"
echo "✅ PHASE 1 EXTRACTION COMPLETE!"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "📁 Generated files:"
echo "   • styles.css (extracted CSS)"
echo "   • scripts.js (common JavaScript)"
echo "   • update-html-files.sh (HTML updater)"
echo ""
echo "📋 Next steps:"
echo "   1. Review styles.css and scripts.js"
echo "   2. Run: ./update-html-files.sh"
echo "   3. Manually review each HTML file:"
echo "      - Verify <link rel=\"stylesheet\" href=\"/styles.css\"> in <head>"
echo "      - Remove inline <style> blocks"
echo "      - Add <script src=\"/scripts.js\"></script> before </body>"
echo "      - Remove duplicate inline <script> blocks"
echo "      - Keep GA tracking in <head>"
echo "   4. Test locally (open HTML files in browser)"
echo "   5. Commit and push"
echo ""
echo "⚠️  Don't forget: Fix duplicate GA pageview tracking while you're at it!"
echo "═══════════════════════════════════════════════════════════"
