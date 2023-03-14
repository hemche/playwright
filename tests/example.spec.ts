import { test, expect } from './fixtures';

test.only('has title', async ({ page }) => {
  // await page.pause()
  await page.goto('chrome-extension://dpfkahghgnhfgnnfnbcdicbgbcpdbigm/ui/popups/go-play-music.html')
  // await page.pause()
});
