return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  keys = {
    { "<leader>ob", "c**<C-r>\"**<Esc>", mode = "x", desc = "Bold", ft = "markdown" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "3rd/image.nvim",
      opts = {
        backend = "kitty",
        integrations = {
          markdown = {
            enabled = true,
            clear_in_insert_mode = true,
            only_render_image_at_cursor = false,
            filetypes = { "markdown" },
          },
        },
        max_width = 100,
        max_height = 20,
        max_height_window_percentage = 50,
        max_width_window_percentage = nil,
        window_overlap_clear_enabled = true,
        window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
      },
    },
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/Personal",
      },
    },

    completion = {
      nvim_cmp = false,
      min_chars = 2,
    },

    mappings = {
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      ["<leader>on"] = {
        action = "<cmd>ObsidianNew<CR>",
        opts = { buffer = true, desc = "New note" },
      },
      ["<leader>oo"] = {
        action = "<cmd>ObsidianQuickSwitch<CR>",
        opts = { buffer = true, desc = "Quick switch" },
      },
      ["<leader>os"] = {
        action = "<cmd>ObsidianSearch<CR>",
        opts = { buffer = true, desc = "Search" },
      },
      ["<leader>ot"] = {
        action = "<cmd>ObsidianToday<CR>",
        opts = { buffer = true, desc = "Today's note" },
      },
      ["<leader>ob"] = {
        action = "<cmd>ObsidianBacklinks<CR>",
        opts = { buffer = true, desc = "Backlinks" },
      },
      ["<leader>ol"] = {
        action = "<cmd>ObsidianLinks<CR>",
        opts = { buffer = true, desc = "Links" },
      },
      ["<leader>or"] = {
        action = "<cmd>ObsidianRename<CR>",
        opts = { buffer = true, desc = "Rename" },
      },
      ["<leader>oi"] = {
        action = "<cmd>ObsidianPasteImg<CR>",
        opts = { buffer = true, desc = "Paste image" },
      },
      ["<leader>oc"] = {
        action = "<cmd>ObsidianTOC<CR>",
        opts = { buffer = true, desc = "Table of contents" },
      },
      ["<leader>og"] = {
        action = "<cmd>ObsidianTags<CR>",
        opts = { buffer = true, desc = "Tags" },
      },
    },

    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",
    preferred_link_style = "wiki",

    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      local prefix = os.date("%Y%m%d%H%M")
      if title ~= nil then
        return prefix .. " " .. title
      else
        return prefix
      end
    end,

    picker = {
      name = "fzf-lua",
      note_mappings = {
        new = "<C-x>",
        insert_link = "<C-l>",
      },
      tag_mappings = {
        tag_note = "<C-x>",
        insert_tag = "<C-l>",
      },
    },

    sort_by = "modified",
    sort_reversed = true,

    ui = {
      enable = true,
      update_debounce = 200,
      max_file_length = 5000,
      checkboxes = {
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        ["!"] = { char = "", hl_group = "ObsidianImportant" },
      },
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
    },

    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,

    follow_img_func = function(img)
      vim.fn.jobstart({ "qlmanage", "-p", img })
    end,

    attachments = {
      img_folder = "assets/imgs",
    },
  },
}
