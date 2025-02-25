local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- ls.add_snippets("ruby", {
--   s("frozen1", { t("# frozen_string_literal: true") }),
-- })

ls.add_snippets("ruby", {
  s("handler", {
    t("# frozen_string_literal: true"),
    t({ "", "def " }), i(1, "handler"), t("(event:, context:)"),
    t({ "", "  # TODO: Implementar lógica de la función Lambda" }),
    t({ "", "  { statusCode: 200, body: 'Hello from Lambda!' }" }),
    t({ "", "end" }),
  }),
})


