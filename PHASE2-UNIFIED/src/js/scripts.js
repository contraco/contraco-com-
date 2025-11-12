// contraco Unified JavaScript
// This file is shared across all 5 TLD sites

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

// TODO: Add your other JavaScript code here
