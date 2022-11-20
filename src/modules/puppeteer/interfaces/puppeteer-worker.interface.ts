import { Browser, Page } from 'puppeteer';

export interface PuppeteerWorker {
  // workerMap: Map<string, Browser>;
  create(id: string): Promise<Browser>;
  close(id: string): Promise<void>;
  get(id: string): Promise<Browser>;
  getPage(id: string): Promise<Page>;
}
