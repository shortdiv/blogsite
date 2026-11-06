// Keeps static/fonts in Netlify's build cache so builds only hit Fontshare when the cache is empty.
// To pull fresh font files, use "Clear cache and deploy site" in Netlify.
const FONTS_DIR = 'static/fonts';

module.exports = {
  async onPreBuild({ utils }) {
    if (await utils.cache.restore(FONTS_DIR)) {
      console.log(`fonts-cache: restored ${FONTS_DIR}`);
    }
  },

  async onPostBuild({ utils }) {
    if (await utils.cache.save(FONTS_DIR)) {
      console.log(`fonts-cache: saved ${FONTS_DIR}`);
    }
  },
};
