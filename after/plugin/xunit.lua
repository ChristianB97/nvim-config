require("xunit").setup({

    command = {clean = true, verbosity = "m", targs = {}, cargs = {}},
    virt_text = {
        idle = "Run test",
        running = "Running ᕕ( ᐛ )ᕗ",
        passed = "✓ (⌐■_■)",
        failed = "✗ (ಥ﹏ಥ)",
        inln_passed = "( ͡° ͜ʖ ͡°)👌",
        inln_failed = "(¬_¬)ノ☓"
    },
    border = {"┌", "─", "┐", "└", "┘", "│"},
    notify = true
})
