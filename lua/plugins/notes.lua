return {
    "backdround/global-note.nvim",
    enabled = false,
    opts = {
        filename = "global.md",
        directory = "~/Documents/notes/",
        additional_presets = {
            rumah = {
                filename = "rumah.md",
                title = "Catatan Rumah",
                command_name = "NoteRumah",
            },
            kerja = {
                filename = "kerja.md",
                title = "Catatan Kerja",
                command_name = "NoteKerja",
            },
        },
    },
}
