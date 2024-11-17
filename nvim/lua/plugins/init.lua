return {



  { "nvzone/volt" , lazy = true },
  { "nvzone/menu" , lazy = true },
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

	{
    "lambdalisue/suda.vim",
		cmd = { "SudaRead", "SudaWrite"}
	},

  {
    "onsails/lspkind.nvim",
  },

  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },


  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- {
      --   "zbirenbaum/copilot-cmp",
      --   dependencies = "copilot.lua",
      --   after = { "copilot.lua", "nvim-cmp"},
      --   opts = {},
      --   config = function(_, opts)
      --     local copilot_cmp = require("copilot_cmp")
      --     copilot_cmp.setup(opts)
      --     -- attach cmp source whenever copilot attaches
      --     -- fixes lazy-loading issues with the copilot cmp source
      --   vim.api.nvim_create_autocmd("LspAttach", {
      --               callback = function(args)
      --                   local client = vim.lsp.get_client_by_id(args.data.client_id)
      --                   if client and (not "copilot" or client.name == "copilot") then
      --                       return copilot_cmp._on_insert_enter({})
      --                   end
      --               end,
      --           })
      --   end,
      -- },

      -- {
      --   "zbirenbaum/copilot-cmp",
      --   config = function ()
      --     require("copilot_cmp").setup()
      --   end
      -- },


      {
        -- snippet plugin
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets",
        opts = { history = true, updateevents = "TextChanged,TextChangedI" },
        config = function(_, opts)
          require("luasnip").config.set_config(opts)
          require "nvchad.configs.luasnip"
        end,
      },

      -- autopairing of (){}[] etc
      {
        "windwp/nvim-autopairs",
        opts = {
          fast_wrap = {},
          disable_filetype = { "TelescopePrompt", "vim" },
        },
        config = function(_, opts)
          require("nvim-autopairs").setup(opts)

          -- setup cmp for autopairs
          local cmp_autopairs = require "nvim-autopairs.completion.cmp"
          require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
      },

      -- cmp sources plugins
      {
        "saadparwaiz1/cmp_luasnip",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
      },
    },

    -- config = function(_, opts)
    --   table.insert(opts.sources, { name = "copilot", group_index = 0})
    --   require'cmp'.setup(opts)
    -- end,

    config = function()
      local opts = require("nvchad.configs.cmp")
      require("cmp").setup(opts)
    end,

    -- opts = function()
    --   return require "nvchad.configs.cmp"
    -- end,
  },





  -- These are some examples, uncomment them if you want to see them work!
   {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "mfussenegger/nvim-dap"
  },

  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },

  {
    "nvim-neotest/nvim-nio"
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },--
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier"
  		},
  	},
  },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
