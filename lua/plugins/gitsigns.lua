return {
  {
    "gitsigns.nvim",
    for_cat = 'general.always',
    event = "DeferredUIEnter",
    -- cmd = { "" },
    -- ft = "",
    -- keys = "",
    -- colorscheme = "",
    after = function ()
      require('gitsigns').setup({
        -- See `:help gitsigns.txt`
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map({ 'n', 'v' }, ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to next Git hunk' })

          map({ 'n', 'v' }, '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true, desc = 'Jump to previous Git hunk' })

          -- Actions
          -- visual mode
          map('v', '<leader>Ghs', function()
            gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = '[G]it [h]unk [s]tage' })
          map('v', '<leader>Ghr', function()
            gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = '[G]it [h]unk [r]eset' })
          -- normal mode
          map('n', '<leader>GHs', gs.stage_hunk, { desc = '[G]it [H]unk [s]tage' })
          map('n', '<leader>GHr', gs.reset_hunk, { desc = '[G]it [H]unk [r]eset' })
          map('n', '<leader>GHu', gs.undo_stage_hunk, { desc = '[G]it [H]unk stage [u]ndo' })
          map('n', '<leader>GS', gs.stage_buffer, { desc = '[G]it [S]tage buffer' })
          map('n', '<leader>GR', gs.reset_buffer, { desc = '[G]it [R]eset buffer' })
          map('n', '<leader>Gp', gs.preview_hunk, { desc = '[G]it [p]review hunk' })
          map('n', '<leader>Gb', function()
            gs.blame_line { full = false }
          end, { desc = '[G]it [b]lame line' })
          map('n', '<leader>Gd', gs.diffthis, { desc = '[G]it [d]iff against index' })
          map('n', '<leader>GD', function()
            gs.diffthis '~'
          end, { desc = '[G]it [D]iff against last commit' })

          -- Toggles
          map('n', '<leader>Gtb', gs.toggle_current_line_blame, { desc = '[G]it [t]oggle [b]lame line' })
          map('n', '<leader>Gtd', gs.toggle_deleted, { desc = '[G]it [t]oggle show [d]eleted' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
        end,
      })
      vim.api.nvim_set_hl(0, 'GitSignsAdd', { link = 'DiffAdd' })
      vim.api.nvim_set_hl(0, 'GitSignsChange', { link = 'DiffChange' })
      vim.api.nvim_set_hl(0, 'GitSignsDelete', { link = 'DiffDelete' })
    end,
  },
}
