/* eslint-disable @typescript-eslint/naming-convention */
import { Inject } from '@nestjs/common';
import { getContextToken } from '../puppeteer.util';

export const InjectContext = (instanceName?: string): ParameterDecorator =>
  Inject(getContextToken(instanceName));
