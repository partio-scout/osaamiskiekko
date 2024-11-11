export interface HttpRequestOptions {
  /**
   * Request path
   */
  path: string;
  /**
   * Request query parameters
   */
  query?: object;
  /**
   * Request payload
   */
  payload?: object;
  /**
   * Additional request headers
   */
  headers?: object;
}
