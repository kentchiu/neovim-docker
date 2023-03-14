-----------------------
--- Snippet File
-----------------------

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet


ls.add_snippets("typescript", {
  s("ternary", {
    i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
  }),
  s("form", {
    t({
      "  form = new FormGroup({",
      "  	field1: new FormControl('', { validators: [Validators.required] }),",
      "  })",
      "",
      "  submitted = false;",
      "",
      "",
    }),
    t({
      "  get f() {",
      "    return this.form.controls;",
      "  }",
      "",
      "",
    }),
    t({
      "  onSubmit() {",
      "    this.submitted = true;",
      "    if (this.form.invalid) {",
      "      return;",
      "    }",
      "  }",
      "",
      "",
    }),
  })
})



ls.add_snippets("html", {
  s("form", {
    t("<form (ngSubmit)=\"onSubmit()\" [formGroup]=\"form\">"),
    t(""),
    t("</form>")
  }),
  s("field", fmt([[
  <input [ngClass]="{ 'is-invalid': submitted && f.^name$.errors }" class="form-control" formControlName="^name$" type="text" />
  <div *ngIf="submitted && f.^name$.errors" class="invalid-feedback">
    <div *ngIf="f.^name$.errors.required" i18n="@@idevice.validations.required">必填</div>
    <div *ngIf="f.^name$.errors.min">最小值為1</div>
    <div *ngIf="f.^name$.errors.pattern">必須是正整數</div>
  </div>
			]], {
    name = i(1, "name"),
  }, {
    delimiters = "^$",
    repeat_duplicates = true
  })),
  s("select", fmt([[
  <select (ngModelChange)="on^name2~Change($event)" class="form-control" formControlName="^name~">
    <option [ngValue]="'ALL'">全部</option>
    <option *ngFor="let opt of ^name~s" [ngValue]="opt.value">{{ opt.key }}</option>
  </select>
   ]], {
    name = i(1, "name"),
    name2 = i(2, "CaptalName")
  }, {
    delimiters = "^~",
    repeat_duplicates = true
  }))
})


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
