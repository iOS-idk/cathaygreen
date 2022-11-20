import { getContextToken, getPageToken } from './puppeteer.util';
import type { BrowserContext } from 'puppeteer';

export function createPageProviders(
  instanceName?: string,
  pages: string[] = [],
) {
  return pages.map((page) => ({
    provide: getPageToken(page),
    useFactory: (context: BrowserContext) => context.newPage(),
    inject: [getContextToken(instanceName)],
  }));
}
