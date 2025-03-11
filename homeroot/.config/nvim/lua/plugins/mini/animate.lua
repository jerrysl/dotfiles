local animate = require('mini.animate')

-- Make all animations faster (to taste)
animate.setup({
    cursor = {
        enable = false, -- line highlight is good enough
        timing = animate.gen_timing.linear({ duration = 2, unit = 'step' }),
    },
    scroll = {
        timing = animate.gen_timing.linear({ duration = 3, unit = 'step' }),
    },
    resize = {
        timing = animate.gen_timing.linear({ duration = 2, unit = 'step' }),
    },
    open = {
        timing = animate.gen_timing.linear({ duration = 2, unit = 'step' }),
    },
    close = {
        timing = animate.gen_timing.linear({ duration = 2, unit = 'step' }),
    },
})
