class people::gongo {
  include emacs
  include packer
  include phantomjs

  $packages = [
    'bazaar',
    'curl',
    'curl-ca-bundle',
    'ffmpeg',
    'figlet',
    'gifsicle',
    'global',
    'gnu-sed',
    'gnupg',
    'graphviz',
    'jq',
    'libyaml',
    'mercurial',
    'mplayer',
    'nkf',
    'ssh-copy-id',
    'the_silver_searcher',
    'tmux',
    'tree',
    'wget',
    'youtube-dl',
    'zsh',
    'zsh-completions'
  ]

  package { $packages:
    ensure => latest
  }

  Package <| title == 'boxen/brews/emacs' |> {
    install_options => [
      '--cocoa',
      '--srgb',
      '--japanese'
    ]
  }
}
