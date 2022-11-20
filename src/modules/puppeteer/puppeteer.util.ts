import { DEFAULT_PUPPETEER_INSTANCE_NAME } from './puppeteer.constants';
/**
 * Get a token for the Puppeteer instance for the given Instance name
 * @param instanceName The unique name for the Puppeteer worker
 */
export function getWorkerToken(
  instanceName: string = DEFAULT_PUPPETEER_INSTANCE_NAME,
): string {
  return `${instanceName}Worker`;
}
/**
 * Get a token for the Puppeteer instance for the given Instance name
 * @param instanceName The unique name for the Puppeteer instance
 */
export function getInstanceToken(
  instanceName: string = DEFAULT_PUPPETEER_INSTANCE_NAME,
): string {
  return `${instanceName}Instance`;
}
/**
 * Get a token for the Puppeteer instance for the given Browser name
 * @param instanceName The unique name for the Puppeteer instance
 */
export function getBrowserToken(
  instanceName: string = DEFAULT_PUPPETEER_INSTANCE_NAME,
): string {
  return `${instanceName}Browser`;
}

/**
 * Get a token for the Puppeteer instance for the given BrowserContext name
 * @param instanceName The unique name for the Puppeteer instance
 */
export function getContextToken(
  instanceName: string = DEFAULT_PUPPETEER_INSTANCE_NAME,
): string {
  return `${instanceName}Context`;
}

/**
 * Get a token for the Puppeteer instance for the given Page name
 * @param instanceName The unique name for the Puppeteer instance
 */
export function getPageToken(
  instanceName: string = DEFAULT_PUPPETEER_INSTANCE_NAME,
): string {
  return `${instanceName}Page`;
}
