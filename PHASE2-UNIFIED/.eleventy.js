// 11ty Configuration for contraco multi-site setup
// Builds all 5 TLD sites from one unified codebase

module.exports = function(eleventyConfig) {
  // Copy static assets to output
  eleventyConfig.addPassthroughCopy("src/css");
  eleventyConfig.addPassthroughCopy("src/js");
  eleventyConfig.addPassthroughCopy("src/assets");

  // Copy all favicon and verification files
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/*.png");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/*.ico");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/*.svg");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/*.xml");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/*.txt");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/*.html");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/CNAME");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/robots.txt");
  eleventyConfig.addPassthroughCopy("src/assets-tld/**/sitemap.xml");

  // Copy shared assets (common across all TLDs)
  eleventyConfig.addPassthroughCopy("src/assets-shared");

  // Create a shortcode for the current year
  eleventyConfig.addShortcode("year", () => `${new Date().getFullYear()}`);

  // Date formatting filter
  eleventyConfig.addFilter("dateFormat", function(date) {
    return new Date(date).toLocaleDateString('en-US', {
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  });

  // Watch for changes during development
  eleventyConfig.addWatchTarget("src/css/");
  eleventyConfig.addWatchTarget("src/js/");
  eleventyConfig.addWatchTarget("src/_data/");

  return {
    dir: {
      input: "src",
      includes: "_includes",
      data: "_data",
      output: "_site"
    },
    templateFormats: ["html", "md", "njk"],
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk"
  };
};
