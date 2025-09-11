local helpers = require("helpers/luasnip")
local get_visual = helpers.get_visual

return {
    s({ trig = ";a", snippetType = "autosnippet" }, { t("\\alpha") }),
    s({ trig = ";b", snippetType = "autosnippet" }, { t("\\beta") }),
    s({ trig = ";g", snippetType = "autosnippet" }, { t("\\gamma") }),

    s({ trig = "tt", dscr = "Expands 'tt' into '\texttt{}'" }, fmta("\\texttt{<>}", { i(1) })),
    s({ trig = "([^%a])ff", dscr = "\\frac" }, fmta("\\frac{<>}{<>}", { i(1), i(2) })),

    s(
        { trig = "env", snippetType = "autosnippet" },
        fmta(
            [[
        \begin{<>}
            <>
        \end{<>}
        ]],
            { i(1), i(0), rep(1) }
        )
    ),

    s(
        { trig = "hr", dscr = "The hyperref package's href{}{} command (for url links)" },
        fmta([[\href{<>}{<>}]], {
            i(1, "url"),
            i(2, "display name"),
        })
    ),

    s(
        { trig = "tii", dscr = "textit{}" },
        fmta("\\textit{<>}", {
            d(1, get_visual),
        })
    ),
}
