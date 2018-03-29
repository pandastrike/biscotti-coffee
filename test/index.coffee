import assert from "assert"
import {print, test} from "amen"
import {resolve} from "path"
import processor from "../src"

verify = ({before, actual, expected}) ->
  -> assert.equal expected, await actual do before

before = -> processor {require}

do ->

  print await test "biscotti-coffee", [

    test "from path", verify
      before: before
      actual: (render) -> render path: resolve "./test/files/index.biscotti"
      expected: '# Greetings!\n\nThis is a test.\n\n\
        Hello, Foo!\n\nGoodbye, now!'

    test "from content", verify
      before: before
      actual: (render) -> render
        content: """
          do $ -> "# Greetings!\\n\\n"

          do $ -> "Hello, Bar!"
          """
      expected: '# Greetings!\n\nHello, Bar!'

]
