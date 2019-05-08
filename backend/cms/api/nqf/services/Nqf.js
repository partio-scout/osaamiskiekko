/* global Nqf */
'use strict';

/**
 * Nqf.js service
 *
 * @description: A set of functions similar to controller's actions to avoid code duplication.
 */

// Public dependencies.
const _ = require('lodash');

// Strapi utilities.
const utils = require('strapi-hook-bookshelf/lib/utils/');
const { convertRestQueryParams, buildQuery } = require('strapi-utils');


module.exports = {

  /**
   * Promise to fetch all nqfs.
   *
   * @return {Promise}
   */

  fetchAll: (params, populate) => {
    // Select field to populate.
    const withRelated = populate || Nqf.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const filters = convertRestQueryParams(params);

    return Nqf.query(buildQuery({ model: Nqf, filters }))
      .fetchAll({ withRelated })
      .then(data => data.toJSON());
  },

  /**
   * Promise to fetch a/an nqf.
   *
   * @return {Promise}
   */

  fetch: (params) => {
    // Select field to populate.
    const populate = Nqf.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    return Nqf.forge(_.pick(params, 'id')).fetch({
      withRelated: populate
    });
  },

  /**
   * Promise to count a/an nqf.
   *
   * @return {Promise}
   */

  count: (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = convertRestQueryParams(params);

    return Nqf.query(buildQuery({ model: Nqf, filters: _.pick(filters, 'where') })).count();
  },

  /**
   * Promise to add a/an nqf.
   *
   * @return {Promise}
   */

  add: async (values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Nqf.associations.map(ast => ast.alias));
    const data = _.omit(values, Nqf.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Nqf.forge(data).save();

    // Create relational data and return the entry.
    return Nqf.updateRelations({ id: entry.id , values: relations });
  },

  /**
   * Promise to edit a/an nqf.
   *
   * @return {Promise}
   */

  edit: async (params, values) => {
    // Extract values related to relational data.
    const relations = _.pick(values, Nqf.associations.map(ast => ast.alias));
    const data = _.omit(values, Nqf.associations.map(ast => ast.alias));

    // Create entry with no-relational data.
    const entry = await Nqf.forge(params).save(data);

    // Create relational data and return the entry.
    return Nqf.updateRelations(Object.assign(params, { values: relations }));
  },

  /**
   * Promise to remove a/an nqf.
   *
   * @return {Promise}
   */

  remove: async (params) => {
    params.values = {};
    Nqf.associations.map(association => {
      switch (association.nature) {
        case 'oneWay':
        case 'oneToOne':
        case 'manyToOne':
        case 'oneToManyMorph':
          params.values[association.alias] = null;
          break;
        case 'oneToMany':
        case 'manyToMany':
        case 'manyToManyMorph':
          params.values[association.alias] = [];
          break;
        default:
      }
    });

    await Nqf.updateRelations(params);

    return Nqf.forge(params).destroy();
  },

  /**
   * Promise to search a/an nqf.
   *
   * @return {Promise}
   */

  search: async (params) => {
    // Convert `params` object to filters compatible with Bookshelf.
    const filters = strapi.utils.models.convertParams('nqf', params);
    // Select field to populate.
    const populate = Nqf.associations
      .filter(ast => ast.autoPopulate !== false)
      .map(ast => ast.alias);

    const associations = Nqf.associations.map(x => x.alias);
    const searchText = Object.keys(Nqf._attributes)
      .filter(attribute => attribute !== Nqf.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['string', 'text'].includes(Nqf._attributes[attribute].type));

    const searchInt = Object.keys(Nqf._attributes)
      .filter(attribute => attribute !== Nqf.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['integer', 'decimal', 'float'].includes(Nqf._attributes[attribute].type));

    const searchBool = Object.keys(Nqf._attributes)
      .filter(attribute => attribute !== Nqf.primaryKey && !associations.includes(attribute))
      .filter(attribute => ['boolean'].includes(Nqf._attributes[attribute].type));

    const query = (params._q || '').replace(/[^a-zA-Z0-9.-\s]+/g, '');

    return Nqf.query(qb => {
      if (!_.isNaN(_.toNumber(query))) {
        searchInt.forEach(attribute => {
          qb.orWhereRaw(`${attribute} = ${_.toNumber(query)}`);
        });
      }

      if (query === 'true' || query === 'false') {
        searchBool.forEach(attribute => {
          qb.orWhereRaw(`${attribute} = ${_.toNumber(query === 'true')}`);
        });
      }

      // Search in columns with text using index.
      switch (Nqf.client) {
        case 'mysql':
          qb.orWhereRaw(`MATCH(${searchText.join(',')}) AGAINST(? IN BOOLEAN MODE)`, `*${query}*`);
          break;
        case 'pg': {
          const searchQuery = searchText.map(attribute =>
            _.toLower(attribute) === attribute
              ? `to_tsvector(${attribute})`
              : `to_tsvector('${attribute}')`
          );

          qb.orWhereRaw(`${searchQuery.join(' || ')} @@ to_tsquery(?)`, query);
          break;
        }
      }

      if (filters.sort) {
        qb.orderBy(filters.sort.key, filters.sort.order);
      }

      if (filters.skip) {
        qb.offset(_.toNumber(filters.skip));
      }

      if (filters.limit) {
        qb.limit(_.toNumber(filters.limit));
      }
    }).fetchAll({
      withRelated: populate
    });
  }
};
