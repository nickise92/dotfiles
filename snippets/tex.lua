local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- i(1) is the first stop, i(2) the second, i(0) is the exit

-- Function to check if we are in a math env
local is_math = function()
    return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
    -- Snippet to populate an empty file with some standard packages.
    s({ trig = "setup article", snippetType = "autosnippet" }, {
        -- We starting with a comment in the first line for the compiler
        t("%! TEX root ="),
        f(function()
            return vim.fn.expand("%:p")
        end),
        t({ "", "\\documentclass[a4paper, 11pt]{article}", "" }),
        t({ "\\usepackage[utf8]{inputenc}", "" }),
        t({ "\\usepackage[T1]{fontenc}", "" }),
        t({ "\\usepackage[italian]{babel}", "" }),
        t({ "\\usepackage{amsmath}", "" }),
        t({ "\\usepackage{amssymb}", "" }),
        t({ "\\usepackage{amsthm}", "" }),
        t({ "\\usepackage{tikz}", "" }),
        t({ "\\usepackage{graphicx}", "" }),
        t({ "\\graphicspath{ {./" }),
        i(1), -- Images directory placeholder
        t({ "} }", "" }),
        t({ "", "\\begin{document}", "" }),
        i(2), -- Content placeholder
        t({ "", "\\end{document}" }),
        i(0), -- End position
    }),

    -- Snippet to populate an empty file with some standard packages.
    s({ trig = "setup report", snippetType = "autosnippet" }, {
        -- We starting with a comment in the first line for the compiler
        t("%! TEX root ="),
        f(function()
            return vim.fn.expand("%:p")
        end),
        t({ "", "\\documentclass[a4paper, 11pt]{report}", "" }),
        t({ "\\usepackage[utf8]{inputenc}", "" }),
        t({ "\\usepackage[T1]{fontenc}", "" }),
        t({ "\\usepackage[italian]{babel}", "" }),
        t({ "\\usepackage{amsmath}", "" }),
        t({ "\\usepackage{amssymb}", "" }),
        t({ "\\usepackage{amsthm}", "" }),
        t({ "\\usepackage{titlesec}", "" }),
        t({ "\\usepackage{fancyhdr}", "" }),
        t({ "\\usepackage{tikz}", "" }),
        t({ "\\usepackage{graphicx}", "" }),
        t({ "\\graphicspath{ {./" }),
        i(1), -- Images directory placeholder
        t({ "} }", "" }),
        t({ "", "\\begin{document}", "" }),
        i(2), -- Content placeholder
        t({ "", "\\end{document}" }),
        i(0), -- End position
    }),

    -- Inline Math ($ .. $)
    s({ trig = "mk", snippetType = "autosnippet", wordTrig = true }, {
        t("$"),
        i(1),
        t("$"),
        i(0),
    }),

    -- Display Math with no justification env (just \[ .. \])
    s({ trig = "dm", snippetType = "autosnippet", wordTrig = true }, {
        t({ "\\[", "\t" }),
        i(1),
        t({ "", "\\]" }),
        i(0),
    }),
    -- Display Math (\[ .. \]) with gathered env inside
    s({ trig = "dg", snippetType = "autosnippet", wordTrig = true }, {
        t({ "\\[", "\t" }),
        t("\\begin{gathered}", "\t"),
        i(1),
        t({ "", "\t" }),
        t("\\end{gathered}"),
        t({ "", "\\]" }),
        i(0),
    }),

    -- Display Math with aligned env inside
    s({ trig = "dam", snippetType = "autosnippet", wordTrig = true }, {
        t({ "\\[", "\t" }),
        t("\\begin{aligned}", "\t"),
        i(1),
        t({ "", "\t" }),
        t("\\end{aligned}"),
        t({ "", "\\]" }),
        i(0),
    }),

    -- Autosnippet to set <= to \le and >= to \ge
    s({ trig = "<=", snippetType = "autosnippet" }, {
        t("\\le"),
    }, { condition = is_math }),

    s({ trig = ">=", snippetType = "autosnippet" }, {
        t("\\ge"),
    }, { condition = is_math }),

    -- Function f(x)
    s({ trig = "func", snippetType = "autosnippet" }, {
        i(1),
        t({ "(" }),
        i(2),
        t({ ")" }),
        i(0),
    }, { condition = is_math }),

    -- Derivate f'(x)
    s({ trig = "deriv", snippetType = "autosnippet" }, {
        i(1),
        t({ "'(" }),
        i(2),
        t({ ")" }),
        i(0),
    }, { condition = is_math }),

    -- \left( and \right) parenthesis
    s({ trig = "((", snippetType = "autosnippet", wordTrig = true }, {
        t({ "\\left(" }),
        i(1),
        t({ "\\right)" }),
        i(0),
    }, { condition = is_math }),

    -- Autosnippet for sin and cos
    s({ trig = "cos", snippetType = "autosnippet" }, {
        t({ "\\cos" }),
        i(0),
    }, { condition = is_math }),

    s({ trig = "sin", snippetType = "autosnippet" }, {
        t({ "\\sin" }),
        i(0),
    }, { condition = is_math }),

    s({ trig = "tan", snippetType = "autosnippet" }, {
        t({ "\\tan" }),
        i(0),
    }, { condition = is_math }),

    -- \frac{num}{den}
    s({ trig = "ff", snippetType = "autosnippet" }, {
        t("\\frac{"),
        i(1),
        t("}{"),
        i(2),
        t("}"),
        i(0),
    }, { condition = is_math }),

    -- e^{x}
    s({ trig = "exp", snippetType = "autosnippet" }, {
        t("e^{"),
        i(1),
        t("}"),
        i(0),
    }, { condition = is_math }),

    -- x^{y}
    s({ trig = "pow", snippetType = "autosnippet" }, {
        i(1),
        t("^{"),
        i(2),
        t("}"),
        i(0),
    }, { condition = is_math }),

    -- \sqrt{arg}
    s({ trig = "sq", snippetType = "autosnippet" }, {
        t("\\sqrt{"),
        i(1),
        t("}"),
        i(0),
    }, { condition = is_math }),

    -- \sqrt[n]{arg}
    s({ trig = "rt", snippetType = "autosnippet" }, {
        t("\\sqrt["),
        i(1),
        t("]{"),
        i(2),
        t("}"),
        i(0),
    }, { condition = is_math }),

    -- _{subtext}
    s({ trig = "__", snippetType = "autosnippet" }, {
        i(1),
        t("_{"),
        i(2),
        t("}"),
        i(0),
    }, { condition = is_math }),

    -- \int_{inf}^{sup} arg dx
    s({ trig = "int", snippetType = "autosnippet" }, {
        t("\\int_{"),
        i(1, "-\\infty"),
        t("}^{"),
        i(2, "\\infty"),
        t("} "),
        i(3),
        t(" \\, d"),
        i(4, "x"),
        i(0),
    }, { condition = is_math }),

    -- \lim_{x \to val}
    s({ trig = "lim", snippetType = "autosnippet" }, {
        t("\\lim_{"),
        i(1, "x"),
        t(" \\to "),
        i(2),
        t("} "),
        i(0),
    }, { condition = is_math }),

    -- \lim_{x \to infty}
    s({ trig = "lim+", snippetType = "autosnippet" }, {
        t("\\lim_{"),
        i(1, "x"),
        t(" \\to +\\infty} "),
        i(0),
    }, { condition = is_math }),

    -- \lim_{x \to -infty}
    s({ trig = "lim-", snippetType = "autosnippet" }, {
        t("\\lim_{"),
        i(1, "x"),
        t(" \\to -\\infty} "),
        i(0),
    }, { condition = is_math }),

    -- \lim_{x \to 0}
    s({ trig = "lim0", snippetType = "autosnippet" }, {
        t("\\lim_{"),
        i(1, "x"),
        t(" \\to 0} "),
        i(0),
    }, { condition = is_math }),

    -- \lim_{x \to 0-}
    s({ trig = "lim0-", snippetType = "autosnippet" }, {
        t("\\lim_{"),
        i(1, "x"),
        t(" \\to 0^-} "),
        i(0),
    }, { condition = is_math }),

    -- \lim_{x \to 0+}
    s({ trig = "lim0+", snippetType = "autosnippet" }, {
        t("\\lim_{"),
        i(1, "x"),
        t(" \\to 0^+} "),
        i(0),
    }, { condition = is_math }),

    -- \sum_{i=x}^{n}
    s({ trig = "sum", snippetType = "autosnippet" }, {
        t("\\sum_{"),
        i(1, "i=1"),
        t("}^{"),
        i(2, "n"),
        t("} "),
        i(0),
    }, { condition = is_math }),

    -- Snippet to create a function graph
    s({ trig = "plot", snippetType = "autosnippet" }, {
        t({
            "\\begin{center}",
            "\\begin{tikzpicture}",
            "\t\\begin{axis}[",
            "\t\taxis lines = middle,",
            "\t\tgrid = major,",
            "\t\twidth=10cm, height=7cm,",
            "\t\t",
        }),
        t("xlabel = {$"),
        i(1, "x"),
        t("$},"),
        t({ "", "\t\tylabel = {$" }),
        i(2, "f(x)"),
        t("$},"),
        t({ "", "\t\tdomain = " }),
        i(3, "-5:5"),
        t(","),
        t({ "", "\t\tsamples = 100,", "\t]", "" }),
        t("\t\t\\addplot [red, thick] {"),
        i(4, "x^2"),
        t("};"),
        t({ "", "\t\\end{axis}", "\\end{tikzpicture}", "\\end{center}" }),
        i(0),
    }),
}
