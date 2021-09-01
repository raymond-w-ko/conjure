local _2afile_2a = "fnl/conjure/config.fnl"
local _2amodule_name_2a = "conjure.config"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["_LOCALS"] = {}
  _2amodule_locals_2a = (_2amodule_2a)._LOCALS
end
local autoload = (require("conjure.aniseed.autoload")).autoload
local a, nvim, str = autoload("conjure.aniseed.core"), autoload("conjure.aniseed.nvim"), autoload("conjure.aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
local function ks__3evar(ks)
  return ("conjure#" .. str.join("#", ks))
end
_2amodule_locals_2a["ks->var"] = ks__3evar
local function get_in(ks)
  local v = a.get(nvim.g, ks__3evar(ks))
  if (a["table?"](v) and a.get(v, vim.type_idx) and a.get(v, vim.val_idx)) then
    return a.get(v, vim.val_idx)
  else
    return v
  end
end
_2amodule_2a["get-in"] = get_in
local function filetypes()
  return get_in({"filetypes"})
end
_2amodule_2a["filetypes"] = filetypes
local function get_in_fn(prefix_ks)
  local function _2_(ks)
    return get_in(a.concat(prefix_ks, ks))
  end
  return _2_
end
_2amodule_2a["get-in-fn"] = get_in_fn
local function assoc_in(ks, v)
  a.assoc(nvim.g, ks__3evar(ks), v)
  return v
end
_2amodule_2a["assoc-in"] = assoc_in
local function merge(tbl, opts, ks)
  local ks0 = (ks or {})
  local opts0 = (opts or {})
  local function _5_(_3_)
    local _arg_4_ = _3_
    local k = _arg_4_[1]
    local v = _arg_4_[2]
    local ks1 = a.concat(ks0, {k})
    local current = get_in(ks1)
    if (a["table?"](v) and not a.get(v, 1)) then
      return merge(v, opts0, ks1)
    else
      if (a["nil?"](current) or opts0["overwrite?"]) then
        return assoc_in(ks1, v)
      end
    end
  end
  a["run!"](_5_, a["kv-pairs"](tbl))
  return nil
end
_2amodule_2a["merge"] = merge
return merge({completion = {fallback = "syntaxcomplete#Complete", omnifunc = "ConjureOmnifunc"}, debug = false, eval = {comment_prefix = nil, gsubs = {}, inline_results = true, result_register = "c"}, extract = {context_header_lines = 24, form_pairs = {{"(", ")"}, {"{", "}"}, {"[", "]", true}}, tree_sitter = {enabled = false}}, filetype = {clojure = "conjure.client.clojure.nrepl", fennel = "conjure.client.fennel.aniseed", hy = "conjure.client.hy.stdio", janet = "conjure.client.janet.netrepl", racket = "conjure.client.racket.stdio", scheme = "conjure.client.scheme.stdio"}, filetype_suffixes = {racket = {"rkt"}, scheme = {"scm"}}, filetypes = {"clojure", "fennel", "janet", "hy", "racket", "scheme"}, highlight = {enabled = false, group = "IncSearch", timeout = 500}, log = {botright = false, break_length = 80, fold = {enabled = false, lines = 10, marker = {["end"] = "}%~~~", start = "~~~%{"}}, hud = {anchor = "NE", border = "single", enabled = true, height = 0.3, overlap_padding = 0.1, passive_close_delay = 0, width = 0.42}, strip_ansi_escape_sequences_line_limit = 1000, trim = {at = 10000, to = 6000}, wrap = false}, mapping = {def_word = "gd", doc_word = {"K"}, eval_buf = "eb", eval_comment_current_form = "ece", eval_comment_root_form = "ecr", eval_comment_word = "ecw", eval_current_form = "ee", eval_file = "ef", eval_marked_form = "em", eval_motion = "E", eval_replace_form = "e!", eval_root_form = "er", eval_visual = "E", eval_word = "ew", log_close_visible = "lq", log_reset_hard = "lR", log_reset_soft = "lr", log_split = "ls", log_tab = "lt", log_vsplit = "lv", prefix = "<localleader>"}, path_subs = nil, preview = {sample_limit = 0.3}, relative_file_root = nil})