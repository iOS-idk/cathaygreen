/* eslint-disable @typescript-eslint/naming-convention */
import { Inject } from '@nestjs/common';
import { getPageToken } from '../puppeteer.util';

export const InjectPage = (instanceName?: string): ParameterDecorator =>
  Inject(getPageToken(instanceName));
