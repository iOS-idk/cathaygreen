import { Browser, BrowserContext, PuppeteerLaunchOptions } from 'puppeteer';
import {
  DEFAULT_CHROME_LAUNCH_OPTIONS,
  DEFAULT_PUPPETEER_INSTANCE_NAME,
  PUPPETEER_INSTANCE_NAME,
  PUPPETEER_MODULE_OPTIONS,
} from './puppeteer.constants';
import {
  DynamicModule,
  Global,
  Inject,
  Module,
  OnApplicationShutdown,
  OnModuleDestroy,
  Provider,
} from '@nestjs/common';
import { ModuleRef } from '@nestjs/core';
import {
  getBrowserToken,
  getContextToken,
  getPageToken,
  getWorkerToken,
} from './puppeteer.util';
import PuppeteerExtra from 'puppeteer-extra';

import { PuppeteerWorker } from './interfaces/puppeteer-worker.interface';
import AdBlockPlugin from 'puppeteer-extra-plugin-adblocker';
import BlockResourcesPlugin from 'puppeteer-extra-plugin-block-resources';
import StealthPlugin from 'puppeteer-extra-plugin-stealth';
import type {
  PuppeteerModuleAsyncOptions,
  PuppeteerModuleOptions,
  PuppeteerOptionsFactory,
} from './interfaces/puppeteer-options.interface';

@Global()
@Module({})
export class PuppeteerCoreModule
  implements OnApplicationShutdown, OnModuleDestroy
{
  constructor(
    @Inject(PUPPETEER_INSTANCE_NAME)
    private readonly instanceName: string,
    private readonly moduleRef: ModuleRef,
  ) {}

  onApplicationShutdown() {
    return this.onModuleDestroy();
  }

  static forRoot(
    launchOptions: PuppeteerLaunchOptions = DEFAULT_CHROME_LAUNCH_OPTIONS,
    instanceName: string = DEFAULT_PUPPETEER_INSTANCE_NAME,
  ): DynamicModule {
    const instanceNameProvider = {
      provide: PUPPETEER_INSTANCE_NAME,
      useValue: instanceName,
    };

    const browserProvider = {
      provide: getBrowserToken(instanceName),
      async useFactory() {
        return PuppeteerExtra.use(StealthPlugin())
          .use(AdBlockPlugin())
          .use(
            BlockResourcesPlugin({
              blockedTypes: new Set(['image', 'media', 'font']),
            }),
          )
          .launch(launchOptions);
      },
    };

    const contextProvider = {
      provide: getContextToken(instanceName),
      async useFactory(browser: Browser) {
        return browser.createIncognitoBrowserContext();
      },
      inject: [getBrowserToken(instanceName)],
    };

    const pageProvider = {
      provide: getPageToken(instanceName),
      async useFactory(context: BrowserContext) {
        return context.newPage().then((page) => {
          page.setDefaultNavigationTimeout(60000);
          return page;
        });
      },
      inject: [getContextToken(instanceName)],
    };

    return {
      module: PuppeteerCoreModule,
      providers: [
        instanceNameProvider,
        browserProvider,
        contextProvider,
        pageProvider,
      ],
      exports: [browserProvider, contextProvider, pageProvider],
    };
  }

  static forRootAsync(options: PuppeteerModuleAsyncOptions): DynamicModule {
    const puppeteerInstanceName =
      options.instanceName ?? DEFAULT_PUPPETEER_INSTANCE_NAME;

    const browserProvider = {
      provide: getBrowserToken(puppeteerInstanceName),
      async useFactory(puppeteerModuleOptions: PuppeteerModuleOptions) {
        return PuppeteerExtra.launch(
          puppeteerModuleOptions.launchOptions ?? DEFAULT_CHROME_LAUNCH_OPTIONS,
        );
      },
      inject: [PUPPETEER_MODULE_OPTIONS],
    };

    const contextProvider = {
      provide: getContextToken(puppeteerInstanceName),
      async useFactory(browser: Browser) {
        return browser.createIncognitoBrowserContext();
      },
      inject: [
        PUPPETEER_MODULE_OPTIONS,
        getBrowserToken(puppeteerInstanceName),
      ],
    };

    const pageProvider = {
      provide: getPageToken(puppeteerInstanceName),
      async useFactory(context: BrowserContext) {
        return context.newPage();
      },
      inject: [
        PUPPETEER_MODULE_OPTIONS,
        getContextToken(puppeteerInstanceName),
      ],
    };

    const asyncProviders = this.createAsyncProviders(options);

    return {
      module: PuppeteerCoreModule,
      imports: options.imports,
      providers: [
        ...asyncProviders,
        browserProvider,
        contextProvider,
        pageProvider,
      ],
      exports: [browserProvider, contextProvider, pageProvider],
    };
  }

  static forWorker(
    launchOptions: PuppeteerLaunchOptions & { isGlobal?: boolean },
    instanceName: string = DEFAULT_PUPPETEER_INSTANCE_NAME,
  ): DynamicModule {
    const instanceNameProvider = {
      provide: PUPPETEER_INSTANCE_NAME,
      useValue: instanceName,
    };

    const workerProvider = {
      provide: getWorkerToken(instanceName),
      async useFactory(): Promise<PuppeteerWorker> {
        const _workerMap = new Map<string, Browser>();
        const _pageMap = new Map();
        const _create = async (id: string = _workerMap.size.toString()) => {
          if (_workerMap.has(id)) {
            return _workerMap.get(id);
          }
          const worker = await PuppeteerExtra.use(StealthPlugin())
            .use(AdBlockPlugin())
            .use(
              BlockResourcesPlugin({
                blockedTypes: new Set(['image', 'media', 'font']),
              }),
            )
            .launch(launchOptions);
          _workerMap.set(id, worker);
          return worker;
        };
        const _close = async (id: string) => {
          if (_workerMap.has(id)) {
            const worker = _workerMap.get(id);
            await worker.close();
            _workerMap.delete(id);
          }
        };
        const _get = async (id: string) => {
          if (_workerMap.has(id)) {
            return _workerMap.get(id);
          }
          return _create(id);
        };
        const _getPage = async (id: string) => {
          if (_pageMap.has(id)) {
            return _pageMap.get(id);
          }
          return (await _get(id)).newPage().then((_page) => {
            _pageMap.set(id, _page);
            return _page;
          });
        };

        return {
          create: async (id: string) => _create(id),
          close: async (id: string) => _close(id),
          get: async (id: string) => _get(id),
          getPage: async (id: string) => _getPage(id),
        };
      },
    };

    const browserProvider = {
      provide: getBrowserToken(instanceName),
      async useFactory(worker: PuppeteerWorker) {
        return worker.create('global');
      },
      inject: [getWorkerToken(instanceName)],
    };

    const contextProvider = {
      provide: getContextToken(instanceName),
      async useFactory(browser: Browser) {
        return browser.createIncognitoBrowserContext();
      },
      inject: [getBrowserToken(instanceName)],
    };

    const pageProvider = {
      provide: getPageToken(instanceName),
      async useFactory(context: BrowserContext) {
        return context.newPage().then((page) => {
          page.setDefaultNavigationTimeout(60000);
          return page;
        });
      },
      inject: [getContextToken(instanceName)],
    };

    return {
      module: PuppeteerCoreModule,
      providers: [
        instanceNameProvider,
        workerProvider,
        browserProvider,
        contextProvider,
        pageProvider,
      ],
      exports: [workerProvider, browserProvider, contextProvider, pageProvider],
    };
  }

  async onModuleDestroy() {
    const browser: Browser = this.moduleRef.get(
      getBrowserToken(this.instanceName),
    );

    if (browser?.isConnected()) await browser.close();
  }

  private static createAsyncProviders(
    options: PuppeteerModuleAsyncOptions,
  ): Provider[] {
    if (options.useExisting || options.useFactory) {
      return [this.createAsyncOptionsProvider(options)];
    }
    if (options.useClass) {
      return [
        this.createAsyncOptionsProvider(options),
        {
          provide: options.useClass,
          useClass: options.useClass,
        },
      ];
    }
    return [];
  }

  private static createAsyncOptionsProvider(
    options: PuppeteerModuleAsyncOptions,
  ): Provider {
    if (options.useFactory) {
      return {
        provide: PUPPETEER_MODULE_OPTIONS,
        useFactory: options.useFactory,
        inject: options.inject ?? [],
      };
    }
    if (options.useExisting) {
      return {
        provide: PUPPETEER_MODULE_OPTIONS,
        async useFactory(optionsFactory: PuppeteerOptionsFactory) {
          return optionsFactory.createPuppeteerOptions();
        },
        inject: [options.useExisting],
      };
    }
    if (options.useClass) {
      return {
        provide: PUPPETEER_MODULE_OPTIONS,
        async useFactory(optionsFactory: PuppeteerOptionsFactory) {
          return optionsFactory.createPuppeteerOptions();
        },
        inject: [options.useClass],
      };
    }
    throw new Error('Invalid PuppeteerModule options');
  }
}
