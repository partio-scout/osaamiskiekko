'use strict';

/**
 * Academicdegree.js controller
 *
 * @description: A set of functions called "actions" for managing `Academicdegree`.
 */

module.exports = {

  /**
   * Retrieve academicdegree records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.academicdegree.search(ctx.query);
    } else {
      return strapi.services.academicdegree.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a academicdegree record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.academicdegree.fetch(ctx.params);
  },

  /**
   * Count academicdegree records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.academicdegree.count(ctx.query, populate);
  },

  /**
   * Create a/an academicdegree record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.academicdegree.add(ctx.request.body);
  },

  /**
   * Update a/an academicdegree record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.academicdegree.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an academicdegree record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.academicdegree.remove(ctx.params);
  }
};
