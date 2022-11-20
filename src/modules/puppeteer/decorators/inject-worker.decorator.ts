/* eslint-disable @typescript-eslint/naming-convention */
import { Inject } from '@nestjs/common';
import { getWorkerToken } from '../puppeteer.util';

export const InjectWorker = (instanceName?: string): ParameterDecorator =>
  Inject(getWorkerToken(`${instanceName}`));
