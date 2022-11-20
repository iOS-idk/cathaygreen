import { InjectWorker } from '../puppeteer';
import { Injectable, Logger } from '@nestjs/common';
import { PuppeteerWorker } from '../puppeteer/interfaces/puppeteer-worker.interface';
import { VersionRes } from './dto';

@Injectable()
export class AppService {
  constructor(
    @InjectWorker(`Browser-1`)
    private readonly worker: PuppeteerWorker,
  ) {}

  private readonly logger = new Logger(AppService.name);

  public getVersion(): VersionRes {
    return { version: process.env.npm_package_version };
  }

  public healthz(): string {
    return 'OK';
  }

  public async bot() {
    for (let i = 0; i < 50; i += 1) {
      const page = await this.worker.getPage(`cathay-worker-${i}`);
      const response = await page.goto(
        'https://cathaypacific.formstack.com/forms/cathayhackathon2022_mostpopularsolutionawardvote',
      );

      // click button where name is "Cathay Green"
      await page.click('button[aria-label="Cathay Green"]');

      // click submit button class is "fsNextButton"
      await page.click('.fsSubmitButton');
      this.logger.debug('cathay success', i);
    }
    return 'OK';
  }
}
