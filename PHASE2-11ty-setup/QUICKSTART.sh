#!/bin/bash

# Quick Start Script for 11ty Setup
# This script helps you get started with your 11ty migration

set -e

echo "═══════════════════════════════════════════════════════════"
echo "  contraco Website - 11ty Quick Start"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed"
    echo "   Please install from: https://nodejs.org/"
    exit 1
fi

NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
if [ "$NODE_VERSION" -lt 14 ]; then
    echo "⚠️  Node.js version $NODE_VERSION detected"
    echo "   Please upgrade to Node.js 14 or higher"
    exit 1
fi

echo "✅ Node.js $(node -v) detected"
echo ""

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed"
    echo "   npm should come with Node.js"
    exit 1
fi

echo "✅ npm $(npm -v) detected"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

echo ""
echo "✅ Dependencies installed successfully!"
echo ""

# Create necessary directories if they don't exist
mkdir -p src/_includes
mkdir -p src/_data
mkdir -p src/css
mkdir -p src/js
mkdir -p src/assets

echo "📁 Directory structure verified"
echo ""

# Test build
echo "🔨 Testing build..."
npm run build

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build successful!"
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "  🎉 Setup Complete!"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "📋 Next steps:"
    echo ""
    echo "1. Start development server:"
    echo "   npm start"
    echo ""
    echo "2. Open http://localhost:8080 in your browser"
    echo ""
    echo "3. Edit files in src/ directory"
    echo "   - src/_data/site.json (site settings)"
    echo "   - src/_data/navigation.json (menu items)"
    echo "   - src/_includes/header.njk (header template)"
    echo "   - src/_includes/footer.njk (footer template)"
    echo "   - src/css/styles.css (styles)"
    echo "   - src/js/scripts.js (javascript)"
    echo ""
    echo "4. Create pages in src/ (e.g., src/about.njk)"
    echo ""
    echo "5. Build for production:"
    echo "   npm run build"
    echo "   (outputs to _site/ directory)"
    echo ""
    echo "📚 Documentation:"
    echo "   - README.md (project overview)"
    echo "   - MIGRATION-GUIDE.md (detailed migration steps)"
    echo "   - https://www.11ty.dev/docs/ (11ty docs)"
    echo ""
    echo "═══════════════════════════════════════════════════════════"
else
    echo ""
    echo "❌ Build failed"
    echo "   Check error messages above"
    echo "   See MIGRATION-GUIDE.md for troubleshooting"
fi
