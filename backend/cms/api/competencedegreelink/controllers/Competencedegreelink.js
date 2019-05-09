'use strict';

/**
 * Competencedegreelink.js controller
 *
 * @description: A set of functions called "actions" for managing `Competencedegreelink`.
 */

module.exports = {

  /**
   * Retrieve competencedegreelink records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.competencedegreelink.search(ctx.query);
    } else {
      return strapi.services.competencedegreelink.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a competencedegreelink record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.competencedegreelink.fetch(ctx.params);
  },

  /**
   * Count competencedegreelink records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.competencedegreelink.count(ctx.query, populate);
  },

  /**
   * Create a/an competencedegreelink record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.competencedegreelink.add(ctx.request.body);
  },

  /**
   * Update a/an competencedegreelink record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.competencedegreelink.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an competencedegreelink record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.competencedegreelink.remove(ctx.params);
  }
};
