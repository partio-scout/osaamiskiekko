'use strict';

/**
 * Nqf.js controller
 *
 * @description: A set of functions called "actions" for managing `Nqf`.
 */

module.exports = {

  /**
   * Retrieve nqf records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.nqf.search(ctx.query);
    } else {
      return strapi.services.nqf.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a nqf record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.nqf.fetch(ctx.params);
  },

  /**
   * Count nqf records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.nqf.count(ctx.query, populate);
  },

  /**
   * Create a/an nqf record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.nqf.add(ctx.request.body);
  },

  /**
   * Update a/an nqf record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.nqf.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an nqf record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.nqf.remove(ctx.params);
  }
};
