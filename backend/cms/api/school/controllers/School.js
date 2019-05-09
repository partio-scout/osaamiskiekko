'use strict';

/**
 * School.js controller
 *
 * @description: A set of functions called "actions" for managing `School`.
 */

module.exports = {

  /**
   * Retrieve school records.
   *
   * @return {Object|Array}
   */

  find: async (ctx, next, { populate } = {}) => {
    if (ctx.query._q) {
      return strapi.services.school.search(ctx.query);
    } else {
      return strapi.services.school.fetchAll(ctx.query, populate);
    }
  },

  /**
   * Retrieve a school record.
   *
   * @return {Object}
   */

  findOne: async (ctx) => {
    return strapi.services.school.fetch(ctx.params);
  },

  /**
   * Count school records.
   *
   * @return {Number}
   */

  count: async (ctx, next, { populate } = {}) => {
    return strapi.services.school.count(ctx.query, populate);
  },

  /**
   * Create a/an school record.
   *
   * @return {Object}
   */

  create: async (ctx) => {
    return strapi.services.school.add(ctx.request.body);
  },

  /**
   * Update a/an school record.
   *
   * @return {Object}
   */

  update: async (ctx, next) => {
    return strapi.services.school.edit(ctx.params, ctx.request.body) ;
  },

  /**
   * Destroy a/an school record.
   *
   * @return {Object}
   */

  destroy: async (ctx, next) => {
    return strapi.services.school.remove(ctx.params);
  }
};
