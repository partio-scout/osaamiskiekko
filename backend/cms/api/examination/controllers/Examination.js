'use strict';

/**
 * Examination.js controller
 *
 * @description: A set of functions called "actions" for managing `Examination`.
 */

module.exports = {

  /**
   * Retrieve examination records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.examination.search(ctx.query);
    } else {
      return strapi.services.examination.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a examination record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.examination.fetch(ctx.params);
  },

  /**
   * Count examination records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.examination.count(ctx.query, populate);
  },

  /**
   * Create a/an examination record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.examination.add(ctx.request.body);
  },

  /**
   * Update a/an examination record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.examination.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an examination record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.examination.remove(ctx.params);
  }
};
