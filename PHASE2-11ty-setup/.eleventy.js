// 11ty Configuration for contraco websites
// This file configures how 11ty builds your site

module.exports = function(eleventyConfig) {
  // Copy static assets to output
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/js");
  eleventyConfig.addPassthroughCopy("src/assets");

  // Copy all favicon and verification files
  eleventyConfig.addPassthroughCopy("src/*.png");
  eleventyConfig.addPassthroughCopy("src/*.ico");
  eleventyConfig.addPassthroughCopy("src/*.svg");
  eleventyConfig.addPassthroughCopy("src/*.xml");
  eleventyConfig.addPassthroughCopy("src/*.txt");
  eleventyConfig.addPassthroughCopy("src/*.html"); // For yandex verification
  eleventyConfig.addPassthroughCopy("src/CNAME");
  eleventyConfig.addPassthroughCopy("src/robots.txt");
  eleventyConfig.addPassthroughCopy("src/sitemap.xml");

  // Create a shortcode for the current year (for copyright)
  eleventyConfig.addShortcode("year", () => `${new Date().getFullYear()}`);

  // Create a filter to format dates
  eleventyConfig.addFilter("dateFormat", function(date) {
    return new Date(date).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  });

  // Watch for changes in CSS/JS during development
  eleventyConfig.addWatchTarget("src/css/");
  eleventyConfig.addWatchTarget("src/js/");

  return {
    dir: {
      input: "src",           // Source files
      includes: "_includes",  // Templates and partials
      data: "_data",          // Global data files
      output: "_site"         // Build output (deploy this to GitHub Pages)
    },
    templateFormats: ["html", "md", "njk"],
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk"
  };
};
