return {
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    keys = {
      { "<F6>", function() vim.cmd("CompetiTest run") end, desc = "CP: Run All Testcases" },
      { "<F7>", function() vim.cmd("CompetiTest receive persistently") end, desc = "CP: Start Listening" },
      { "<F8>", function() vim.cmd("CompetiTest add_testcase") end, desc = "CP: Add Testcase" },
      { "<F9>", function() vim.cmd("CompetiTest receive stop") end, desc = "CP: Stop Listening" },
    },
    config = function()
      require("competitest").setup({
        template_file = "/mnt/c/developer/cprbq/template.cpp",
        languages = {
          cpp = { 
            compile = "g++ -std=c++20 -O2 -Wall %s -o ./%s.bin",
            run = "./%s.bin"
          }
        },
      })
    end,
  }
}
