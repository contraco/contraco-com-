#!/usr/bin/env node

/**
 * contraco Multi-Site Deployer
 * Copies built sites to their respective GitHub repositories
 *
 * PREREQUISITES:
 * 1. All GitHub repos cloned locally
 * 2. Sites already built (run npm run build first)
 *
 * Usage:
 *   node deploy-all-sites.js
 */

const fs = require('fs-extra');
const path = require('path');
const { execSync } = require('child_process');
const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function question(prompt) {
  return new Promise((resolve) => {
    rl.question(prompt, resolve);
  });
}

const sites = ['net', 'de', 'kr', 'ru', 'com'];

async function deploy() {
  console.log('═══════════════════════════════════════════════════════════');
  console.log('  contraco Multi-Site Deployer');
  console.log('═══════════════════════════════════════════════════════════');
  console.log('');

  // Check if sites are built
  for (const site of sites) {
    const distPath = path.join(__dirname, 'dist', site);
    if (!fs.existsSync(distPath)) {
      console.error(`❌ dist/${site}/ not found. Run 'npm run build' first.`);
      rl.close();
      process.exit(1);
    }
  }

  console.log('✅ All sites are built and ready to deploy.');
  console.log('');

  // Ask for repo locations
  console.log('📁 Enter the paths to your GitHub repositories:');
  console.log('   (Example: C:\\repos\\contraco-net or /home/user/contraco-net)');
  console.log('');

  const repoPaths = {};
  for (const site of sites) {
    const answer = await question(`contraco-${site} repo path: `);
    repoPaths[site] = answer.trim();

    if (!fs.existsSync(repoPaths[site])) {
      console.error(`❌ Path does not exist: ${repoPaths[site]}`);
      rl.close();
      process.exit(1);
    }
  }

  console.log('');
  console.log('📋 Deployment plan:');
  for (const site of sites) {
    console.log(`   dist/${site}/ → ${repoPaths[site]}`);
  }
  console.log('');

  const confirm = await question('Deploy all sites? (yes/no): ');
  if (confirm.toLowerCase() !== 'yes') {
    console.log('❌ Deployment cancelled.');
    rl.close();
    return;
  }

  console.log('');
  console.log('🚀 Deploying...');
  console.log('');

  // Deploy each site
  for (const site of sites) {
    console.log(`📦 Deploying contraco-${site}...`);

    try {
      const distPath = path.join(__dirname, 'dist', site);
      const repoPath = repoPaths[site];

      // Copy files
      fs.copySync(distPath, repoPath, {
        overwrite: true,
        filter: (src) => {
          // Don't copy .git directory
          return !src.includes('.git');
        }
      });

      console.log(`   ✅ Files copied to ${repoPath}`);

      // Git operations
      const gitCommit = await question(`   Commit and push? (yes/no): `);
      if (gitCommit.toLowerCase() === 'yes') {
        const commitMsg = await question(`   Commit message: `);

        execSync('git add .', { cwd: repoPath, stdio: 'inherit' });
        execSync(`git commit -m "${commitMsg}"`, { cwd: repoPath, stdio: 'inherit' });
        execSync('git push', { cwd: repoPath, stdio: 'inherit' });

        console.log(`   ✅ Committed and pushed`);
      } else {
        console.log(`   ⚠️  Files copied but not committed`);
      }

      console.log('');

    } catch (error) {
      console.error(`   ❌ Deployment failed for ${site}:`);
      console.error(error.message);
      rl.close();
      process.exit(1);
    }
  }

  console.log('═══════════════════════════════════════════════════════════');
  console.log('✅ All sites deployed successfully!');
  console.log('═══════════════════════════════════════════════════════════');

  rl.close();
}

deploy();
