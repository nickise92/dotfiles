# Neovim Configuration

This neovim configuration is being build up incrementally from scratch following this [video series](https://youtube.com/playlist?list=PLy68GuC77sURrnMNi2XR1h58m674KOvLG&si=VJ9KEBJFEir5xOK6) as reference.

## Structure

The configuration is split into core settings and plugin-specific modules:
```text
~/.config/nvim/
├── init.lua              # Entry point
├── lua/
│   ├── config/           # Core settings
│   │   ├── indent.lua    # Tab/Indent behavior
│   │   ├── keymaps.lua   # Global keybindings
│   │   ├── lazy.lua      # Plugin manager bootstrap
│   │   └── options.lua   # Neovim options (UI, clipboard, etc.)
│   └── plugins/          # Plugin modules
│       ├── lsp.lua       # LSP, Mason, and Diagnostic config
│       ├── blink-cmp.lua # Autocompletion engine
│       ├── obsidian.lua  # Obsidian.nvim integration
│       └── ...           # Other modular plugins
├── snippets/             # Custom snippets (LaTeX, etc.)
└── lazy-lock.json        # Plugin lockfile
```

## Key Features
- **Package Management:** `lazy.nvim` for fast, concurrent plugin loading.
- **Completion:** `blink.cmp` for high-performance autocompletion.
- **LSP:** Configured via `nvim-lspconfig` and `mason.nvim` for various programming languages.
- **Note Taking:** Deep integration with Obsidian via `obsidian.nvim`.
- **Navigation**: `oil.nvim` for file system editing and `fzf-lua` for fuzzy finding.
- **Syntax:** `nvim-treesitter` for advanced syntax highlighting.

## Custom Keybindings

The `leader` key is set to `Space`. Custom mappings are organized by functional groups:

### General & Navigation

| **Mapping** | **Action** |
|---------|--------|
| `<leader>st` | Toggle Light/Dark mode |
| `<leader>l` | Open Lazy.nvim panel |
| `-` | Open File Explorer (Oil) in a floating window |
| `gl` | Open Diagnostic float (LSP) |
| `<leader>cf` | Format current file (via Conform) |
| `<Tab>` | Indent selection (Visual mode) |
| `<S-Tab>` | De-indent selection (Visual mode) |

### Contextual Buffer / Split Management

*These commands open a new view and automatically set the local directory (`lcd`) to the 
current file's path*

| **Mapping** | **Action** |
|---------|--------|
| `<leader>bt` | New **Tab** + FZF Search |
| `<leader>bv` | New **Vertical Split** + FZF Search |
| `<leader>bh` | New **Horizontal Split** + FZF Search |
| `<leader>bn` | New **Buffer** in current directory |

### Knowledge Management (Obsidian)

| **Mapping** | **Action** |
|---------|--------|
| `<leader>on` | Create new note |
| `<leader>os` | Search text across all notes |
| `<leader>od` | Go to today's Daily Note |
| `<leader>ol` | Create link from selection (Visual mode) |
| `<leader>oo` | Open current note in Obsidian GUI |

### AI Integration (Avante)

| **Mapping** | **Action** |
|---------|--------|
| `<leader>aa` | Open Avante AI Chat |
| `<leader>ae` | Edit code with AI (inline) |
| `<leader>ar` | Refresh Avante |
| `<leader>af` | Focus Avante window |

### Development (Language Specific)
- **LaTeX (Vimtex):** `<leader>t` prefix (Compile, View, Stop, Errors, Clean).
- **Java:** `<leader>j` prefix (Build Workspace, Clean, Run Main, Stop).
- **Markdown:** `<leader>m` prefix (Live Preview Start/Close).

## Plugins

### Editor enhancements
#### nvim-autopairs
Automatically closes brackets, quotes and parenthesis.

- **Context Awareness:** Integrated with  Treesitter (`check_ts = true`) to avoid adding 
  pairs in invalid contexts (like strings or comments depending on the language).
- **Lazy Loading:** Only triggers when entering **Insert Mode** to keep startup times minimal.

#### conform.nvimn 
A lightweight yet powerful formatter runner.

- **Auto-format:** Configured to format on save (`format_on_save`) with a 5s timeout and LSP fallback.
- **Language Support:** 
    - *PHP*: Uses a dual-stage approach with `php-cs-fixer` (enforcing PSR12) and `prettier` (via
      standalone PHP plugin).
    - *Web (JS/HTML/CSS)*: Prefers `prettierd` for speed, falling back to standard `prettier`.
    - *Other:* Supports `stylua` (Lua), `black/isort` (Python) and `latexindent` (LaTeX).
- **Custom Fixes:** Includes a specific command-line fix for `php-cs-fixer` to handler paths correctly
  on Windows.

##### Conform extra configurations for `php-cs-fixer` 
About the `php-cs-fixer` formatter for PHP, this fix was added from [reddit](https://www.reddit.com/r/neovim/comments/18a77w2/good_lintingformatting_configuration_for_php_in/#:~:text=%2D%2Dformatters%2Elua,true%2C%20%7D%2C%20%7D).

```lua
formatters = {
      ["php-cs-fixer"] = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          "$FILENAME",
        },
        stdin = false,
      },
    },
    notify_on_error = true,
```

#### nvim-highlight-colors
A real-time color highlighter for Neovim.
- **Functionality:** Automatically highlights hex codes, RGB, HSL and CSS variables with their
  actual color directly in the buffer.
- **Performance:** Extremely lightweight with no perceptible impact on editor latency.

#### nvim-lspconfig
The foundation for Language Server Protocol support in Neovim.

- **Automatic Management:** Uses *Mason* and *Mason-tool-installer* to automatically 
  download and update LSPs, formatters, and linters.
- **Key Language Servers:**
    - *PHP:* `intelephense` (configured for high-performance with large projects).
    - *Web:* `ts_ls` (JS/TS), `cssls`, `tailwindcss`.
    - *C#/C++:* `omnisharp` (With EditorConfig support) and `clangd`.
    - *Others:* `pyright` (Python), `texlab` (LaTeX), `lua_ls`, `marksman` (Markdown).
- **UI Enhancements:**
    - Customized diagnostics with *Nerd Font icons*.
    - *Fidget.nvim:* Provides a discrete status UI for LSP indexing and progress.
    - *Document Highlighting:* Automatically highlights references of the word under the cursor.

##### LSP-Specific Keybindings
*These mappings are only active when an LSP is attached to a buffer.*

| **Mapping** | **Action** |
|---------|--------|
| `grd`   | Go to Definition (via FZF) |
| `grr` | Go to References (via FZF) |
| `gri` | Go to Implementation (via FZF) |
| `grn` | Rename variable/symbol project-wide |
| `gra` | Code Actions (quick fixes) |
| `gO` | Document Symbols (search functions/variables in file) |
| `gW` | Workspace Symbols (search symbols in project) |
| `<leader>th` | Toggle Inlay Hints (if supported by the language) |


#### nvim-treesitter
The core engine for advanced syntax highlighting and structural code understanding.

- **Syntax Highlighting:** Provides extremely accurate, fast, and language-aware highlighting for 
  all programmin languages.
- **Ensured Installation:** Automatically manages the installation of parser for a wide range of
  languages.
- **Smart Indentation:** Uses the code's syntax tree to provide more reliable and consistent 
  indentation than standard methods.

##### Treesitter extensions
- *nvim-treesitter-context:* A "sticky scroll" feature that keeps the current function or class
  signature pinned at the top of the screen while you scroll through long files.
- *nvim-treesitter-textobjects:* Allows you to treat structural code elements (like functions,
  classes or loops) as Vim text objects, enabling commands like "delete inside function" or
  "jump to next class".

##### Extra configurations for Markdown files
In markdown treesitter doesn't start automatically, at least at the time these file are written.
In the init.lua file, (**at the very end of it!**) was added the following function to force the starting of the parser:

```lua
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown", 
    callback = function()
        vim.treesitter.start()
    end,
})
```

#### vim-sleuth
Auto-detects indentation settings (tabs vs. spaces) by analyzing the current file and surroinding
files in the project. I does not require a `setup()` function; it works automatically as soon as a
buffer is loaded.

- **Context Aware:** If you open a PHP file with 4 spaces and then a JavaScript file with 2 spaces, 
  Sleuth will adjust `shiftwidth` and `expandtab` on the fly without change global settings.

This is useful when working on team or open-source projects where indentation rules might differ
from personal preferences.

### AI & Assistance
#### avante-nvim 
An AI-powered code companion designed to emulate the experience of the Cursor editor.

- **Provider:** Configured to use **Google Gemini** (specifically gemini-2.5-flash) for fast
  and intelligent code generation and refactoring.
- **Integration**: Deeply integrated with `nvim-treesitter` for code context and `dressing.nvim` 
  for a polished UI.
- **Features**: Supports sidebar chats, inline code planning and automatic multi-file edits.

#### img-clip.nvim
A dependency for Avante that allows for seamless image pasting directly into Markdown/Neovim
buffers (useful for documentation or AI visual context).

### Completion & Snippets

#### blink.cmp

The central engine for autocompletion, designed for high performance and low latency.

- **Engine:** Built in **Rust**, featuring a fuzzy matcher that is typo-resistant and significantly
  faster than Lua-based alternatives.
- **Sources:** Aggregates completions from multiple providers:
    - *LSP:* Real-time suggestions from your language servers (PHP, Python, etc.).
    - *Path:* Smart file system path completion.
    - *Snippets:* Integrated with `LuaSnip` and `friendly-snippets`.
    - *CSS Variables*: Custom integration via `css-vars.nvim` for autocompleting CSS variables
      even across JS/TS files.
- **Key Features:**
    - *Signature Help:* Automatically shows function parameters while typing.
    - *Auto-docs:* Documentation popups appear automatically to explain completion items.
    - *Smart Keymaps:* Uses a custom preset where `<C-e>` accepts the suggestion, while
      keeping `<Tab>` and `<S-Tab>` for native indentation/navigation.

#### LuaSnip

The snippet engine responsible for expanding and navigating code templates.

- **Dynamic Loading**: Configured to lazily load custom Lua-based snippets from the local 
  `snippets/` directory.
- **Smart Behavior:**
    - *History:*  Allows jumping back into a snippet even after leaving insert mode.
    - *Auto-snippets:* Supports snippets that trigger automatically (useful for LaTeX math symbols).
    - *Choice Nodes:* Can cycle through multiple options within a single snippet placeholder.

##### Snippet Navigation Keybindings
*These mappings allow you to "drive" a snippet once it's expanded.*

| **Mapping** | **Action** |
|---------|--------|
| `<C-k>` | Expand the current snippet |
| `<C-l>` | Jump forward to the next placeholder |
| `<C-j` | Jump backward to the previous placeholder |
| `<C-e>` | Cycle choices (if the snippet has multiple options) |

### UI & Aesthetics

#### cyberdream.nvim
The primary colorscheme of this configuration, providing a high-contrast, futuristic dark theme 
with a dedicated light mode.

- **Priority:** Set to 1000 to ensure it loads before any other plugin, preventing flashes of
  default colors.
- **Mode Toggle:** Integrated with a custom shortcut (`<leader>st`) to switch between Dark and 
  Light variants seamlessy.
- **Customization:** Configured with `italic_comments` and `terminal_colors` for a consistent
  expirience across the editor and the built-in terminal.

#### dressing.nvim
Improves the default Neovim UI hooks for better aesthetics and usability.

- **Functionalty:** Automatically replaces the clunky default `vim.ui.select` and `vim.ui.input`
  windows with sleek, floating and searchable interfaces.
- **Integration:** Enhances the experience when using LSP rename, code actions, and other 
  plugins that require user input or selection.

#### noice.nvim
Highly enhances the Neovim UI by replacing the command line, messages, and popupmenu.

- **Command Line:** Replaces the classic bottom bar with a sleek, floating command palette
  in the center of the screen.
- **Notifications:** Integrated with `nvim-notidy` to display messages, LSP progress, and
  alerts in a graceful, animated corner window.
- **LSP Integration:** Hover docs and signature help are rendered in specialized, styled buffers.
- **Visual Consistency:** Custom background colors are set for notifications to ensure they blend
  perfectly with the Cyberdream theme.

#### which-key.nvim
A popup that displays interactive keybinding help as you type.

- **Discovery:** Automatically triggers when you start a key sequence, showing all possible
  continuations with their descriptions.
- **Buffer Context:** Includes a specific mapping (`<leader>?`) to show only the keymaps active
  in the current buffer (extremely useful for LSP or VimTeX specific commands).
- **Organization:** Helps group complex commands under meaningful prefixes (like `<leader>f` to Find
  or `<leader> a` for AI).

#### mini.statusline
A minimal, fast, and fully functional statusline that provides all necessary information at a glance.
- **Clean Design:** Replaces the default statusline with a modern, sectioned bar that adapts its color
  based on the current Vim mode (Normal, Insert, Visual, etc.).
- **Contextual Information:** 
    - *Vim Mode:* Clear visual indicator of the current state.
    - *Git Branch:* Shows the active branch (integrated with `plenary` and `project.nvim`).
    - *File Metadata:* Displays filename, modification status, and filetype icons (via `mini.icons`).
    - *LSP Diagnostics:* Real-time count of Errors, Warnings, and Hints.
    - *Location:* Current line, column and total percentage of the file.
- **Performance:** Optimized to avoid any lag during fast scrolling or heavy LSP activity.

### Navigation & Search

#### fzf-lua.nvim 
A high-performance fuzzy finder focused on speed and minimal overhead.

- **Core Navigation:** Keybindings for finding files (`<leader>ff`), searching through 
  buffers (`<leader><leader>`), and revisiting recently opened files (`<leader>fo`).
- **Grepping:** Includes powerful ripgrep integration for searching text across the 
  project  (`<leader>fg`) or within the current buffer (`<leader>/`).
- **Config Access:** A dedicated shortcut (`<leader>fc`) to instantly jump into Neovim 
  configuration files.
- **Developer Utilities:** Quick access to LSP diagnostics (`<leader>fd`), help tags (`<leader>fh`), 
  and keymap discovery (`<leader>fk`).
- **Workflow Continuity:** The "Resume" feature (`<leader>fr`) allows reopening the last search
  exactly where it was left.

*Dependencies:* Uses `mini.icons`.

#### oil.nvim
A file explorer that lets you edit your file system like a normal Neovim buffer.

- **Edit as Text:** Perform file operations (create, delete, rename, move) using standard
  Vim motions and commands.
- **Hidden Files:** Configured to always show hidden files (`show_hidden = true`), making it
  ideal for managing `.env`, `.gitignore` or config files.
- **Visual Feedback:** Uses `mini.icons` to provide file-type icons directly in the buffer, 
  maintaining a clean and informative look.
- **Always Ready:** `lazy = false` ensures that Oil is available as soon as you open a directory
  or call the mapping. avoiding glitches typical of lazy-loading file explores.

##### Keymappings

| **Mapping** | **Action** |
|---------|--------|
| `-` | Open the current directory |
| `:w` | Save all the work done in the directory |


### Markdown & Documentation

#### live-preview.nvim 
A real-time previewer for Markdown files.

- **Integration:** Works with `fzf-lua` to manage and select preview targets.
- **Workflow:** Allows seeing document changes instantly without leaving the editor, essential
  for maintaining the Obsidian vault.

#### obsidian.nvim
Integrates Obsidian vault directly into Neovim for seamless knowledge managmenet.

- **Workspace Integration:** Focused on "knowledge" vault (located on kDrive for syncing).
- **Daily Workflow:** Automated daily notes created in `00_Inbox` using custom template (`daily_template.md`)
- **Clean organization:** Overrides the default ID generation (`note_id_func`) to ensure filenames
  match exactly the provided title, avoiding cluttered filenames with random suffixes.
- **Lazy Loading:** The plugin only activates when opening Markdown files or calling specific
  commands, keeping startup fast.

##### Obsidian keymappings
| **Mapping** | **Commands** | **Action** |
|---------|--------|-------|
| `<leader>on` | `:ObsidianNew` | Create a new note, asking for the title |
| `<leader>od` | `:ObsidianToday` | Create/Open daily note |
| `<leader>os` | `:ObsidianSearch` | Search text inside notes (uses ripgrep) |
| `<leader>oo` | `:ObsidianOpen` | Open current note in Obsidian GUI |

#### vimtex
The complete solution for editing LaTeX files in Neovim.
- **Integration:** Seamlessly connected with *Sumatra PDF* for a professional typesetting
  workflow on Windows.
- **Forward Search:** Jump from a specific line in your .tex code directly to the corresponding
  point in the PDF (`@line` integration).
- **Inverse Search:** Double-click a point in the PDF to jump back to the exact line of code in
  Neovim (requires `nvim --remote-silent` command in SumatraPDF settings).
- **Continuous Compilation:** It can be configured to watch for changes and recompile the document on save.

### Project Management & Utils

#### plenary.nvim
The *standard library* for Neovim Lua development.

- **Essential Dependency:** It doesn't provide visible features on its own, but it's required
  by *Telescope*, *FZF-lua*, *Gitsigns*, and *Obsidian* to handle asynchronous tasks, file paths,
  and testing.

Ensures that complex plugins run smoothly without freezing the editor UI during heavy operations.

#### project.nvim
An all-in-one project management solution for Neovim.

- **Root Detection:** Automatically identifies the "root" of a project by looking for markers
  like `.git`, `Makefile`, `package.json` or `platformio.ini`, etc...
- **Auto-Chdir:** Changes the current working directory (`pwd`) as you switch between files
  from different projects, ensuring that searches and terminal commands are always context-aware.
- **History:** Keep track of your recently opened projects.

