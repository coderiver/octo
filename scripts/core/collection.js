define(function (require) {
	'use strict';

	var _ = require('_');
	var Backbone = require('Backbone');
	var eventBrokerMixin = require('core/event-broker-mixin');
	var Model = require('core/Model');

	var Collection = Backbone.Collection.extend({
		model: Model
	});

	_.extend(Collection.prototype, eventBrokerMixin);

	return Collection;
});