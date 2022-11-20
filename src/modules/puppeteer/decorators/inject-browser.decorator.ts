/* eslint-disable @typescript-eslint/naming-convention */
import { Inject } from '@nestjs/common';
import { getBrowserToken } from '../puppeteer.util';

export const InjectBrowser = (instanceName?: string): ParameterDecorator =>
  Inject(getBrowserToken(instanceName));
