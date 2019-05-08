'use strict';

/**
 * Fieldofstudy.js controller
 *
 * @description: A set of functions called "actions" for managing `Fieldofstudy`.
 */

module.exports = {

  /**
   * Retrieve fieldofstudy records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.fieldofstudy.search(ctx.query);
    } else {
      return strapi.services.fieldofstudy.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a fieldofstudy record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.fieldofstudy.fetch(ctx.params);
  },

  /**
   * Count fieldofstudy records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.fieldofstudy.count(ctx.query, populate);
  },

  /**
   * Create a/an fieldofstudy record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.fieldofstudy.add(ctx.request.body);
  },

  /**
   * Update a/an fieldofstudy record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.fieldofstudy.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an fieldofstudy record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.fieldofstudy.remove(ctx.params);
  }
};
