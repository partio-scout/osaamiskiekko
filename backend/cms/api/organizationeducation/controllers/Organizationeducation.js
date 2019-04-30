'use strict';

/**
 * Organizationeducation.js controller
 *
 * @description: A set of functions called "actions" for managing `Organizationeducation`.
 */

module.exports = {

  /**
   * Retrieve organizationeducation records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.organizationeducation.search(ctx.query);
    } else {
      return strapi.services.organizationeducation.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a organizationeducation record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.organizationeducation.fetch(ctx.params);
  },

  /**
   * Count organizationeducation records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.organizationeducation.count(ctx.query, populate);
  },

  /**
   * Create a/an organizationeducation record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.organizationeducation.add(ctx.request.body);
  },

  /**
   * Update a/an organizationeducation record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.organizationeducation.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an organizationeducation record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.organizationeducation.remove(ctx.params);
  }
};
