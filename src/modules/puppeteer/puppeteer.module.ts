import { DynamicModule, Module } from '@nestjs/common';
import { PuppeteerCoreModule } from './puppeteer-core.module';
import { PuppeteerLaunchOptions } from 'puppeteer';
import { createPageProviders } from './puppeteer.providers';
import type { PuppeteerModuleAsyncOptions } from './interfaces/puppeteer-options.interface';

/**
 * Module for the Puppeteer
 */
@Module({})
export class PuppeteerModule {
  /**
   * Inject the Puppeteer synchronously.
   * @param options Options for the Browser to be launched
   * @param instanceName A unique name for the connection.  If not specified, a default name
   * will be used.
   */
  static forRoot(
    options?: PuppeteerLaunchOptions & { isGlobal?: boolean },
    instanceName?: string,
  ): DynamicModule {
    return {
      module: PuppeteerModule,
      global: options?.isGlobal,
      imports: [PuppeteerCoreModule.forRoot(options, instanceName)],
    };
  }

  /**
   * Inject the Puppeteer asynchronously, allowing any dependencies such as a configuration
   * service to be injected first.
   * @param options Options for asynchronous injection
   */
  static forRootAsync(options: PuppeteerModuleAsyncOptions): DynamicModule {
    return {
      module: PuppeteerModule,
      global: options.isGlobal,
      imports: [PuppeteerCoreModule.forRootAsync(options)],
    };
  }

  /**
   * Inject Pages.
   * @param pages An array of the names of the pages to be injected.
   * @param instanceName A unique name for the connection. If not specified, a default name
   * will be used.
   */
  static forFeature(
    pages: string[] = [],
    instanceName?: string,
  ): DynamicModule {
    const providers = createPageProviders(instanceName, pages);
    return {
      module: PuppeteerModule,
      providers,
      exports: providers,
    };
  }

  static forWorker(
    options?: PuppeteerLaunchOptions & { isGlobal?: boolean },
    instanceName?: string,
  ): DynamicModule {
    return {
      module: PuppeteerModule,
      global: options?.isGlobal,
      imports: [PuppeteerCoreModule.forWorker(options, instanceName)],
    };
  }
}
