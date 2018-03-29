"use strict";

Object.defineProperty(exports, "__esModule", {
  value: true
});
exports.default = undefined;

var _biscotti = require("biscotti");

var processor;

exports.default = processor = function ({ globals = { require } }) {
  return (0, _biscotti.engine)([{
    sandbox: (0, _biscotti.sandbox)(globals)
  }, (0, _biscotti.loader)({
    coffeescript: {
      index: true,
      extensions: [".biscotti"]
    }
  }), (0, _biscotti.fallback)(), (0, _biscotti.include)(), _biscotti.buffer, _biscotti.filters.string]);
};

exports.default = processor;