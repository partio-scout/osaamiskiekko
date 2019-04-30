'use strict';

/**
 * Academy.js controller
 *
 * @description: A set of functions called "actions" for managing `Academy`.
 */

module.exports = {

  /**
   * Retrieve academy records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.academy.search(ctx.query);
    } else {
      return strapi.services.academy.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a academy record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.academy.fetch(ctx.params);
  },

  /**
   * Count academy records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.academy.count(ctx.query, populate);
  },

  /**
   * Create a/an academy record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.academy.add(ctx.request.body);
  },

  /**
   * Update a/an academy record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.academy.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an academy record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.academy.remove(ctx.params);
  }
};
