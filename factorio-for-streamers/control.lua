require('util')

commands.add_command('fmods', nil, function(command)
    modlist = game.active_mods
    game.write_file('fmods.json', '', false, 0)

    json_modlist = ffs.util.table_to_json(modlist)

    game.write_file('fmods.json', json_modlist, true, 0)
)