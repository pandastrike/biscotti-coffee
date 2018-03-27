import {loader, fallback, buffer, include,
  filters, sandbox, engine} from "biscotti"

processor = ({globals = {require}}) ->

  engine [
    sandbox: sandbox globals
    loader
      coffeescript:
        index: true
        extensions: [ ".biscotti" ]
    do fallback
    do include
    buffer
    filters.string
  ]

export {processor as default}
