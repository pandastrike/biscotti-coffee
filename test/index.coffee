import assert from "assert"
import {print, test} from "amen"
import processor from "../src"

do ->

  print await test "biscotti-coffee", do ->

    [

      render = processor {require}

      test "from path", ->

        # we need to do this because this path is relative to
        # file not where the tests may be run from ...
        path = resolve "./test/files/index.biscotti"
        result = await render {path}
        assert.equal result,
          '# Greetings!\n\nThis is a test.\n\nHello, Foo!\n\nGoodbye, now!'

      test "from path (with import)", ->

        result = await render path: resolve "./test/files/html/index.biscotti"
        assert.equal result,
          "<html><body><h1>Hello, World!</h1></body></html>"

      test "from content", ->

        content = """
          do $ -> "# Greetings!\\n\\n"

          do $ -> "Hello, Bar!"
          """
        result = await render {content}
        assert.equal result,
          '# Greetings!\n\nHello, Bar!'

    ]
