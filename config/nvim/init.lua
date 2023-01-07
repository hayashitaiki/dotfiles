--[[    _
 __   _(_)_ __ ___  _ __ ___
 \ \ / / | '_ ` _ \| '__/ __|
  \ V /| | | | | | | | | (__
 (_)_/ |_|_| |_| |_|_|  \___|
--]]

-- Packer.nvim の設定 そのうち削除 {{{
-------------------------------
-- Packer.nvim
--   再新化 :PackerSync
-------------------------------
-- vim.cmd[[packadd packer.nvim]]
-- 
-- require'packer'.startup(function()
--   use 'wbthomason/packer.nvim'
--   use 'nvim-lua/plenary.nvim' -- used by rest.nvim / gitsigns.nvim
-- 
--   -- 表示関連
--   use 'kyazdani42/nvim-web-devicons'
--   use 'nvim-treesitter/nvim-treesitter'
--   use 'rebelot/kanagawa.nvim'
-- 
--   -- status line
--   use 'hoob3rt/lualine.nvim'
-- 
--   use 'lewis6991/gitsigns.nvim'
--   use 'folke/trouble.nvim'
-- 
--   use 'Townk/vim-autoclose'
--   use 'yuttie/comfortable-motion.vim'
--   use 'ntpeters/vim-better-whitespace'
--   use 'tamago324/lir.nvim'
--   use 'tyru/open-browser.vim'
-- 
--   -- curl
--   use 'NTBBloodbath/rest.nvim'
-- 
--   -- for test
--   use 'klen/nvim-test'
-- 
--   -- for fazzy search
--   use 'vijaymarupudi/nvim-fzf'
--   use 'ibhagwan/fzf-lua'
-- 
--   -- for LSP
--   -- use 'neovim/nvim-lspconfig'
--   -- use 'hrsh7th/cmp-nvim-lsp' -- builtin LSP client
--   -- use 'hrsh7th/cmp-buffer'   -- buffer words
--   -- use 'hrsh7th/nvim-cmp'
--   -- use 'hrsh7th/cmp-vsnip'
--   -- use 'hrsh7th/vim-vsnip'
--   use 'neovim/nvim-lspconfig'
--   -- use 'williamboman/mason.nvim'
--   -- use 'williamboman/mason-lspconfig.nvim'
--   use "hrsh7th/nvim-cmp"
--   use "hrsh7th/cmp-nvim-lsp"
--   use "hrsh7th/vim-vsnip"
--   use 'hrsh7th/cmp-buffer' -- for buffer words
-- 
--   -- for jump (Like EasyMotion)
--   use 'phaazon/hop.nvim'
-- end)
-- }}}

-------------------------------
-- lazy.nvim (Plugin 管理)
-------------------------------
-- :Lazy で管理画面
-- "$HOME/.local/share/nvim/lazy" に実態が入る
-------------------------------
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require('lazy').setup({
  'nvim-lua/plenary.nvim', -- used by rest.nvim / gitsigns.nvim

  -- 表示関連
  'nvim-treesitter/nvim-treesitter',
  'kyazdani42/nvim-web-devicons', -- icon
  'rebelot/kanagawa.nvim', -- color scheme
  'hoob3rt/lualine.nvim', -- status line

  -- for git
  'lewis6991/gitsigns.nvim',

  -- Filer
  'tamago324/lir.nvim',

  -- for Fazzy Search
  'vijaymarupudi/nvim-fzf',
  'ibhagwan/fzf-lua',

  -- for LSP
  'neovim/nvim-lspconfig',
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-buffer',
  'folke/trouble.nvim', -- LSP でエラーを一覧表示

  'phaazon/hop.nvim', -- EasyMotion jump
  'tyru/open-browser.vim', -- ブラウザで開く
  'NTBBloodbath/rest.nvim', -- .rest ファイルのやつ
  'klen/nvim-test', -- テスト実行
  'Townk/vim-autoclose', -- ()
  'yuttie/comfortable-motion.vim', -- ぬるぬるスクロール
  'johnfrankmorgan/whitespace.nvim' -- 行末空白のハイライト
})


-------------------------------
-- General
-------------------------------
-- 一般設定
vim.opt.fenc           = 'utf-8'          -- 文字コード
vim.opt.fileencoding   = 'utf-8'          -- 保存時の文字コード
vim.opt.fileencodings  = 'utf-8'          -- 読み込み時の文字コードの自動判別. 左側が優先
vim.opt.fileformats    = 'unix,dos,mac'   -- 改行コードの自動判別. 左側が優先
-- vim.opt.ambiwidth   = 'double'         -- floating windowで枠線が辺になるのでコメントアウト
vim.opt.swapfile       = false            -- swapファイルを作成しない
vim.opt.autoread       = true             -- 編集中ファイルが書き換えられたら、自動リロード
vim.opt.undofile       = true
vim.opt.clipboard      = 'unnamed'        -- クリップボードとyunk,putを共有
vim.opt.history        = 5000             -- 保存するコマンド履歴の数
vim.opt.mouse          = 'a'              -- マウス操作をオンにする
vim.opt.foldmethod     = 'marker'         -- folding
vim.opt.lazyredraw     = true             -- コマンド実行中は再描写しない
vim.opt.ttyfast        = true             -- 高速ターミナル接続
-- vim.cmd('scriptencoding utf-8')        -- vimrcの文字コード

-- コマンドラインモードのファイル名補完
vim.opt.wildmenu       = true
vim.opt.wildmode       = 'list:longest,full'

-- 検索関連設定
vim.opt.hlsearch       = false     -- 検索文字列をハイライトしない
vim.opt.incsearch      = true      -- インクリメンタルサーチを行う
vim.opt.ignorecase     = true      -- 大文字と小文字を区別しない
vim.opt.smartcase      = true      -- 大文字と小文字の混在で検索した場合、大文字と小文字を区別
vim.opt.wrapscan       = true      -- 最後尾まで検索を終えたら次の検索で先頭に移る
vim.opt.gdefault       = true      -- 置換の時 g オプションをデフォルトで有効にする
vim.opt.inccommand     = 'split'   -- 置換のインクリメンタル表示（nvimのみ）

-- 表示関連設定
vim.opt.number         = true     -- 行番号表示
vim.opt.relativenumber = false     -- 相対行表示
vim.opt.cursorline     = true      -- 行のハイライト
vim.opt.signcolumn     = 'yes'     -- 行番号の左側のサイズ固定
vim.opt.list           = true      -- 不可視文字の表示設定
vim.opt.showmode       = false     -- 「-- 挿入 --」とかの非表示
vim.opt.colorcolumn    = '80'      -- 80文字目にラインを入れる
-- vim.opt.showmatch   = true      -- 対応括弧のハイライト
-- vim.opt.matchtime   = 3         -- 対応括弧のハイライトを3秒に
-- vim.opt.ruler       = true      -- カーソルが何行目の何列目に置かれているかを表示する
-- vim.opt.expandtab   = false     -- タブをタブとして扱う(スペースに展開しない)
-- vim.opt.softtabstop = 0
-- vim.opt.autoindent  = true
-- vim.opt.laststatus  = 2         -- ステータスラインの表示
-- vim.opt.cmdheight   = 1         -- メッセージ表示欄の行数

-- インデント設定
vim.opt.tabstop        = 2         -- タブを表示するときの幅
vim.opt.shiftwidth     = 2         -- タブを挿入するときの幅
vim.opt.breakindent    = true      -- 折り返しを同じインデントで表示
vim.opt.expandtab      = true      -- TAB -> Space
vim.cmd('au BufNewFile,BufRead *.go set noexpandtab tabstop=4 shiftwidth=4')

-- コマンドタイポ予防
vim.api.nvim_create_user_command('Q',  'q',  {})
vim.api.nvim_create_user_command('W',  'w',  {})
vim.api.nvim_create_user_command('WQ', 'wq', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})

-- Terminalモード
vim.cmd('autocmd TermOpen * startinsert') -- 常にInsertModeでスタート
vim.cmd('command! -nargs=* Te bo sp | te <args>')
-- vim.api.nvim_create_user_command('Te', 'bo sp | te <args>', { nargs = * })

-- Fold(折りたたみ)
vim.opt.foldtext = [[getline(v:foldstart)]]

-- コマンドの通常時の高さをオフにする
vim.opt.cmdheight = 0

-- 🚀 {{{
-- if vim.fn.has('nvim-0.8') == 1 then
-- end -- }}}


-------------------------------
-- Key Mapping
-------------------------------
local map = vim.api.nvim_set_keymap

-- 甘えるな、hjklを使え
map('', '<LEFT>',  '<NOP>', { noremap = true })
map('', '<Up>',    '<NOP>', { noremap = true })
map('', '<Right>', '<NOP>', { noremap = true })
map('', '<Down>',  '<NOP>', { noremap = true })

-- XとCはコピーしない
map('', 'x', '"_x',  { noremap = true })
map('', 'X', '"_dd', { noremap = true })
map('', 'c', '"_c',  { noremap = true })
map('', 'C', '"_C',  { noremap = true })

-- Leader を使ったキーマッピング
-- なるべくデフォルトのキーマッピングを無くさないように、
-- 独自のマッピングは極力 Leader を使うようにする。
vim.g.mapleader = " "

map('n', '<LEADER>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', {}) ----------------------- a: [LSP] コードアクション (action)
map('n', '<LEADER>b', '<cmd>lua require("fzf-lua").buffers()<CR>', {}) -------------------- b: [FZF] buffer 検索 (buffer)
map('n', '<LEADER>c', '<cmd>lua require("rest-nvim").run()<CR>', {}) ---------------------- c: .html で curl 実行 (curl)
map('n', '<LEADER>e', '<cmd>lua vim.diagnostic.goto_next()<CR>', {}) ---------------------- e: [LSP] 次の警告にジャンプ (error)
map('n', '<LEADER>E', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {}) ---------------------- E: [LSP] 前の警告にジャンプ (error)
map('n', '<LEADER>f', '<cmd>lua require("fzf-lua").files()<CR>', {}) ---------------------- f: [FZF] file 検索 (file)
map('n', '<LEADER>g', '<cmd>lua vim.lsp.buf.definition()<CR>', {}) ------------------------ g: [LSP] 定義ジャンプ (go)
map('n', '<LEADER>G', '<cmd>lua require("fzf-lua").lsp_references()<CR>', {}) ------------- G: [LSP/FZF] 参照元検索 (go)
map('n', '<LEADER>h', ':Gitsigns next_hunk<CR>', {}) -------------------------------------- h: 次の hunk へジャンプ (hunk)
map('n', '<LEADER>H', ':Gitsigns prev_hunk<CR>', {}) -------------------------------------- H: 前の hunk へジャンプ (hunk)
map('n', '<LEADER>i', '<cmd>lua require("fzf-lua").lsp_implementations()<CR>', {}) -------- i: [LSP/FZF] 実装検索 (inplement)
map('n', '<LEADER>j', '<cmd>lua require("hop").hint_patterns()<cr>', { noremap = true }) -- j: EasyMotion (jump)
map('',  '<LEADER>k', '<Plug>(openbrowser-smart-search)', {}) ----------------------------- k: ブラウザで検索
map('n', '<LEADER>n', '<cmd>lua vim.lsp.buf.rename()<CR>', {}) ---------------------------- n: [LSP] リネーム (name)
map('n', '<LEADER>o', 'mzo<ESC>', {}) ----------------------------------------------------- o: 下に空行追加 (o)
map('n', '<LEADER>O', 'mzO<ESC>', {}) ----------------------------------------------------- O: 上に空行追加 (o)
map('n', '<LEADER>r', '<cmd>lua require("fzf-lua").live_grep()<CR>', {})  ----------------- r: [FZF] ripgrep 検索 (rg)
map('n', '<LEADER>s', '<cmd>lua require("fzf-lua").git_status()<CR>', {}) ----------------- s: [FZF] git status 検索 (status)
map('n', '<LEADER>t', ':TestNearest<CR>', {}) --------------------------------------------- t: 現在行のテスト実行 (test)
map('n', '<LEADER>T', ':TestLast<CR>', {}) ------------------------------------------------ T: 最後に行ったテスト実行 (test)
map('n', '<LEADER>v', ':Gitsigns preview_hunk<CR>', {}) ----------------------------------- v: git 差分表示 (view)
map('n', '<LEADER>x', ':TroubleToggle<CR>', {})

map('n', '<LEADER><Tab>',   '<C-w>w', {})
map('n', '<LEADER><Space>', ':set hlsearch!<CR>', {})
map('n', '<LEADER>-',       ':e %:h<CR>', { noremap = true, silent = true }) --- 現在フォルダを開く
map('n', '<LEADER><BS>',    ':bd!<CR>', {}) ------------------------------------ buffer 削除 (delete)
map('n', '<LEADER><CR>',    ':! ', { noremap = true })

map('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

-- いずれ入れたいLSPの設定
-- map('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', {})
-- map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', {})
-- map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})
-- map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {})
-- map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', {})


-------------------------------
-- ColorScheme
-------------------------------
vim.cmd('syntax on')

local my_colors = {
  bg = 'none', -- 背景色をなくす
}
require'kanagawa'.setup({ colors = my_colors })
vim.cmd('colorscheme kanagawa')

-- vim.cmd('hi Visual  ctermbg=241')      -- Visual(選択範囲)の白を濃くする
-- vim.cmd('hi Comment ctermfg=102')      -- コメントちょっと濃く
-- vim.cmd('hi LineNr  ctermfg=102')      -- 行番号ちょっと濃く
-- vim.cmd('hi CursorLineNr ctermfg=180') -- 現在行番号ハイライト

-- highlight LspDiagnosticsSignError        ctermfg=9
-- highlight LspDiagnosticsVirtualTextError ctermfg=9
-- highlight LspDiagnosticsUnderlineError   ctermfg=9


-------------------------------
-- Treesitter
-------------------------------
-- NOTE: tree-sitterが荒ぶったら
--  1. brew upgrade tree-sitter
--  2. :TSUpdate
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true, -- syntax highlightを有効に
    disable = {
      -- errorが出るものをoffにする
      'lua',
    }
  },
  -- ensure_installed = 'maintained', -- :TSInstall maintainedと同じ
  indent = {
    enable = true, -- tree-sitterによるインデントを有効に
    disable = {
      'javascript',
    }
  }
}


-------------------------------
-- lualine (ステータスライン)
-------------------------------
local status, lualine = pcall(require, "lualine")
if (not status) then return end
lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'jellybeans',
    section_separators = {'', ''}, -- {'', ''}
    component_separators = {'|', '|'},
    disabled_filetypes = {},
  },
  -- filename / branch / filetype / location
  sections = {
    lualine_a = {'mode'},
    lualine_b = {{
      'diagnostics',
      sources = {'nvim_diagnostic'},
      symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
    }},
    lualine_c = {'filename', 'diff'},
    lualine_x = {}, lualine_y = {}, lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {}, lualine_b = {}, lualine_c = {},
    lualine_x = {}, lualine_y = {}, lualine_z = {},
  },
  tabline = {},
  extensions = {'fugitive'}
}


-------------------------------
-- lsp
-------------------------------
-- エラー文言を表示しない
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- error signを優先して表示
vim.diagnostic.config {
  severity_sort = true
}

-- LspReference をハイライトする
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]
-- 旧設定 {{{
-- local nvim_lsp = require('lspconfig')
-- local on_attach = function(client, bufnr)
--   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--   local opts = { noremap=true, silent=true }
--   -- buf_set_keymap('n', '<LEADER>d', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   buf_set_keymap('n', '<LEADER>e', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   buf_set_keymap('n', '<LEADER>E', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   buf_set_keymap('n', '<LEADER>g', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   map('n', '<LEADER>i', '<cmd>lua require("fzf-lua").lsp_implementations()<CR>', {})
--   map('n', '<LEADER>G', '<cmd>lua require("fzf-lua").lsp_references()<CR>', {})
-- end
-- 
-- -- エラー文言を表示しない
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
-- )
-- 
-- -- error signを優先して表示
-- vim.diagnostic.config {
--   severity_sort = true
-- }
-- 
-- -- local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
-- -- for type, icon in pairs(signs) do
-- --   local hl = "LspDiagnosticsSign" .. type
-- --   vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- -- end
-- }}}


----------------------
-- LSP SERVER
----------------------
-- TypeScript
-- Install: npm install -g typescript-language-server
require('lspconfig').tsserver.setup {
  on_attach = on_attach
}
-- Golang
-- Install: go install golang.org/x/tools/gopls@latest
require('lspconfig').gopls.setup{
  on_attach = on_attach
}
-- Rust
-- Install: brew install rust-analyzer
require('lspconfig').rust_analyzer.setup{
  on_attach = on_attach
}
-- Terraform
-- Install: brew install hashicorp/tap/terraform-ls
require('lspconfig').terraformls.setup{
  on_attach = on_attach
}


----------------------
-- nvim-cmp
----------------------
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- for `vsnip` users.
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    -- { name = "buffer" },
    -- { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    -- 一旦コメントアウト
    -- ['<C-p>'] = cmp.mapping.select_prev_item(),
    -- ['<C-n>'] = cmp.mapping.select_next_item(),
    -- ['<C-l>'] = cmp.mapping.complete(),
    -- ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})
-- 旧設定 {{{
-- local cmp = require'cmp'
-- 
-- vim.opt.completeopt = 'menu,menuone,noselect'
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--       vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--     end,
--   },
--   mapping = {
--     ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
--     ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
--     ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
--     ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
--     ['<C-c>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
--     -- ['<C-y>'] = cmp.config.disable,
--     ['<C-e>'] = cmp.mapping({
--       i = cmp.mapping.abort(),
--       c = cmp.mapping.close(),
--     }),
--     ['<CR>'] = cmp.mapping.confirm({ select = true }),
--   },
--   -- setup config source
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     { name = 'vsnip' },
--   }, {
--     { name = 'buffer' },
--   })
-- })


-- 1. LSP Sever management
-- require('mason').setup()
-- require('mason-lspconfig').setup_handlers({ function(server)
--   local opt = {
--     -- -- Function executed when the LSP server startup
--     -- on_attach = function(client, bufnr)
--     --   local opts = { noremap=true, silent=true }
--     --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--     --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
--     -- end,
--     capabilities = require('cmp_nvim_lsp').default_capabilities(
--       vim.lsp.protocol.make_client_capabilities()
--     )
--   }
--   require('lspconfig')[server].setup(opt)
-- end })
-- }}}


-------------------------------
-- rest-console
-------------------------------
vim.g.vrc_set_default_mapping = 0
vim.g.vrc_auto_format_uhex    = 1
vim.g.vrc_curl_opts = { ['-sS'] = "", ['-i'] = ""}

local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'


-------------------------------
-- gitsigns
-------------------------------
require('gitsigns').setup {
  signs = {
    add          = {text = '+'},
    change       = {text = '~'},
    delete       = {text = '_'},
    topdelete    = {text = '‾'},
    changedelete = {text = '~'},
  },
  keymaps = {}, -- default mappingはオフ
  sign_priority = 6,
}


-------------------------------
-- fzf-lua
-------------------------------
require'fzf-lua'.setup {
  winopts = {
    preview = { layout = 'vertical' } -- horizontal|vertical|flex
  }
}


-------------------------------
-- rest-nvim
-------------------------------
require("rest-nvim").setup({
  result_split_in_place = true,
  -- env_file = '.env'
})


-------------------------------
-- lir.nvim (ファイラー)
-------------------------------
local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'
require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['<CR>']  = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-v>'] = actions.vsplit,

    ['-']     = actions.up,
    ['q']     = actions.quit,
    ['y']     = actions.yank_path,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = true,
      highlight_dirname = true
    },
  },
  hide_cursor = false,
}


-------------------------------
-- whitespace
-------------------------------
require('whitespace-nvim').setup({
  highlight = 'DiffDelete',
  -- ignored_filetypes = {},
})


-------------------------------
-- Hop
-------------------------------
require'hop'.setup { keys = 'jkl' }
